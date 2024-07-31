import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash.dart';
import '../../features/onBoarding/presentation/function/check_is_onborading_visited.dart';
import '../../features/onBoarding/presentation/views/on_boarding_view.dart';
import '../../features/home/cubits/home_cubit/home_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';

final GoRouter router = GoRouter(
  initialLocation: checkIsOnBoardingVisited() ? "/homeView" : "/",
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => const OnBoardnigView()),
    ),
    GoRoute(
      path: '/splashView',
      builder: ((context, state) => const SplashLoadingView()),
    ),
    GoRoute(
      path: '/homeView',
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit()
              ..removeSpaces()
              ..fetchAllContacts(),
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: HomeView(),
            ),
          )),
    ),
  ],
);
