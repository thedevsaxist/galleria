import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final class RiverpodLogger extends ProviderObserver {
  RiverpodLogger({Logger? logger})
    : _logger =
          logger ??
          Logger(
            printer: PrettyPrinter(
              methodCount: 0, // No stack trace lines
              errorMethodCount: 5, // Lines for error method calls
              lineLength: 80,
              colors: true,
              printEmojis: true,
              dateTimeFormat: DateTimeFormat.dateAndTime,
            ),
          );

  final Logger _logger;

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    final providerName = (context.provider.name ?? context.runtimeType).toString();

    if (_shouldSkip(providerName)) return;

    _logger.i('$providerName created');
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    final providerName = (context.provider.name ?? context.runtimeType).toString();

    if (_shouldSkip(providerName)) return;

    _logger.d({
      'method': 'didUpdateProvider',
      'provider': providerName,
      'previousValue': '$previousValue',
      'newValue': '$newValue',
    });
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    final providerName = (context.provider.name ?? context.runtimeType).toString();

    if (_shouldSkip(providerName)) return;

    _logger.w('$providerName disposed');
  }

  bool _shouldSkip(String providerName) {
    final name = providerName.toLowerCase();
    return name.contains('bloc') || name.contains('cubit');
  }
}
