import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const OneTapWhatsApp(),
    ),
  );
}