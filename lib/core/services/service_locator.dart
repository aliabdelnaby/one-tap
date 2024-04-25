import 'package:get_it/get_it.dart';
import '../cache/cache_helper.dart';
import '../../features/home/cubits/home_cubit/home_cubit.dart';
import '../../features/settings/settings_cubit/settings_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<HomeCubit>(HomeCubit());
  getIt.registerSingleton<SettingsCubit>(SettingsCubit());
  
}
