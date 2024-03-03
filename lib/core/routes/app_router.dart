import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:via_whatsapp/features/home/presentation/views/home_view.dart';
import 'package:via_whatsapp/features/settings/presentation/settings_cubit/settings_cubit.dart';
import 'package:via_whatsapp/features/settings/presentation/views/select_language_view.dart';
import 'package:via_whatsapp/features/settings/presentation/views/settings_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          )),
    ),
    GoRoute(
      path: '/settingsView',
      builder: ((context, state) => BlocProvider(
            create: (context) => SettingsCubit(),
            child: const SettingsView(),
          )),
    ),
    GoRoute(
      path: '/selectLanguageView',
      builder: ((context, state) => const SelectLanguageView()),
    ),
  ],
);
