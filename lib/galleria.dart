import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galleria/core/routes/router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Galleria extends ConsumerWidget {
  const Galleria({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(393, 852), // iPhone 14 Pro dimensions as a modern default
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: "Galleria",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
