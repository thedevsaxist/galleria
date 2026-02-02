import 'dart:io';
import 'package:galleria/core/logger/logger_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/constants/supabase_constants.dart';

part 'supabase_service.g.dart';

@riverpod
SupabaseService supabaseService(Ref ref) {
  final loggerService = ref.read(loggerServiceProvider);
  final supabaseClient = Supabase.instance.client;

  return SupabaseService(loggerService, supabaseClient);
}

class SupabaseService {
  final LoggerService _loggerService;
  final SupabaseClient _supabaseClient;
  SupabaseService(this._loggerService, this._supabaseClient);

  Future<String?> uploadImage(File file, String fileName, {Map<String, String>? metadata}) async {
    try {
      final bytes = await file.readAsBytes();
      await _supabaseClient.storage
          .from(SupabaseConstants.bucketName)
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: FileOptions(cacheControl: '3600', upsert: true, contentType: 'image/jpeg', metadata: metadata),
          );

      return _supabaseClient.storage.from(SupabaseConstants.bucketName).getPublicUrl(fileName);
    } catch (e) {
      _loggerService.e('Error uploading image: $e');
      rethrow;
    }
  }

  /// Records the asset upload in the database to avoid listing the storage bucket later.
  Future<void> recordAssetUpload(String localId, String storagePath) async {
    try {
      await _supabaseClient.from('galleria_assets').upsert({
        'local_id': localId,
        'storage_path': storagePath,
        'uploaded_at': DateTime.now().toIso8601String(),
      }, onConflict: 'local_id');
    } catch (e) {
      _loggerService.e('Error recording asset upload: $e');
      // We don't rethrow here to avoid failing the upload if only the DB record fails,
      // though in a production app you might want more robust handling.
    }
  }

  /// Fetches the list of uploaded local IDs from the database.
  Future<List<String>> getUploadedAssetIds() async {
    try {
      final List<dynamic> data = await _supabaseClient.from('galleria_assets').select('local_id');
      return data.map((item) => item['local_id'] as String).toList();
    } catch (e) {
      _loggerService.e('Error fetching uploaded asset IDs: $e');
      return [];
    }
  }

  Future<List<FileObject>> listImages() async {
    try {
      final List<FileObject> files = await _supabaseClient.storage.from(SupabaseConstants.bucketName).list();
      _loggerService.d('uploaded images:\n${files.map((e) => e.name).toList()}');
      return files;
    } catch (e) {
      _loggerService.e('Error listing images: $e');
      rethrow;
    }
  }
}
