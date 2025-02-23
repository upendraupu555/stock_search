import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market_search/core/app_theme.dart';
import 'package:stock_market_search/providers/theme_provider.dart';
import 'core/app_router.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final authState = ref.watch(authProvider);

    return authState.when(
      loading: () => Container(),
      data: (token) => MaterialApp.router(
        routerConfig: router(token),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
      ),
      error: (err, stack) => Container(),
    );
  }
}
