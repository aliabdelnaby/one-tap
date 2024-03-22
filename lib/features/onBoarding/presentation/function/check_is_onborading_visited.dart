import 'package:one_tap/core/cache/cache_helper.dart';
import 'package:one_tap/core/services/service_locator.dart';

checkIsOnBoardingVisited() =>
    getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
