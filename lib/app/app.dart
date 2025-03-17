import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tagit_mobile/app/routes.dart';

import 'app_provider.dart';

class TagItApp extends ConsumerWidget {
  const TagItApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadApp.custom(
      themeMode: ref.watch(appProvider),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName('orange', brightness: Brightness.dark),
      ),
      theme: ShadThemeData(brightness: Brightness.dark, colorScheme: ShadColorScheme.fromName('orange')),
      appBuilder: (context, theme) {
        return MaterialApp.router(
          routerConfig: router,
          theme: theme,
          builder: (context, child) {
            return ShadToaster(child: child!);
          },
        );
      },
    );
  }
}
