import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_tap/core/cache/cache_helper.dart';
import 'core/constants/constants.dart';
import 'core/models/contact_model.dart';
import 'core/simple_bloc_observer.dart';
import 'core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>(kContacts);
  Bloc.observer = SimpleBlocObserver();

  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        startLocale: const Locale("en"),
        child: const OneTapApp(),
      ),
    ),
  );
}
