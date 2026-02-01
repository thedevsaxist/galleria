import 'package:flutter/material.dart';
import 'package:galleria/core/routes/router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Galleria extends ConsumerWidget {
  const Galleria({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: "Galleria",
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
