import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gutenberg_tome/l10n/l10n.dart';
import 'package:gutenberg_tome/core/route/app_router.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Gutenberg Tome",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: AppColor.background,
        ),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
