import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_tap/core/constants/constants.dart';
import 'package:one_tap/core/models/contact_model.dart';
import 'core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kContacts);
  Hive.registerAdapter(ContactModelAdapter());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      startLocale: const Locale("ar"),
      child: const OneTapApp(),
    ),
  );
}
