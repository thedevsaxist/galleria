import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/supabase_constants.dart';
import 'core/logger/riverpod_logger.dart';
import 'galleria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(url: SupabaseConstants.url, anonKey: SupabaseConstants.anonKey);

  runApp(ProviderScope(observers: [RiverpodLogger()], child: Galleria()));
}
