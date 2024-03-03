import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';

class OneTapApp extends StatelessWidget {
  const OneTapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: context.locale.languageCode == 'ar' ? "Rubik" : "Signika",
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
    );
  }
}
