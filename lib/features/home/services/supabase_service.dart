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

  Future<String?> uploadImage(File file, String fileName) async {
    try {
      final bytes = await file.readAsBytes();
      await _supabaseClient.storage
          .from(SupabaseConstants.bucketName)
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: true, contentType: 'image/jpeg'),
          );

      return _supabaseClient.storage.from(SupabaseConstants.bucketName).getPublicUrl(fileName);
    } catch (e) {
      _loggerService.e('Error uploading image: $e');
      rethrow;
    }
  }
}
