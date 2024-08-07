import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/cache/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'core/constants/constants.dart';
import 'core/models/contact_model.dart';
import 'core/simple_bloc_observer.dart';
import 'core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await ScreenUtil.ensureScreenSize();
  await getIt<CacheHelper>().init();
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
        child: const OneTapApp(),
      ),
    ),
  );
}
