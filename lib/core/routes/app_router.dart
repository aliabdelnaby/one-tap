import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:via_whatsapp/features/home/presentation/views/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          )),
    ),
  ],
);
