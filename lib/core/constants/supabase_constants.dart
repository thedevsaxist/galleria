import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConstants {
  static String url = dotenv.env['SUPABASE_URL'] ?? "";
  static String anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? "";
  static String bucketName = dotenv.env['SUPABASE_BUCKET_NAME'] ?? "";
}   
