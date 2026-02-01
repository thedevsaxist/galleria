import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/constants/supabase_constants.dart';

part 'supabase_service.g.dart';

@riverpod
SupabaseService supabaseService(Ref ref) {
  return SupabaseService();
}

class SupabaseService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<String?> uploadImage(File file, String fileName) async {
    try {
      await _supabaseClient.storage
          .from(SupabaseConstants.bucketName)
          .upload(fileName, file, fileOptions: const FileOptions(cacheControl: '3600', upsert: false));

      return _supabaseClient.storage.from(SupabaseConstants.bucketName).createSignedUrl(fileName, 60);
    } catch (e) {
      // Handle the error appropriately
      print('Error uploading image: $e');
      rethrow;
    }
  }
}
