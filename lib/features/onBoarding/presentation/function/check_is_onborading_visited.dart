import '../../../../core/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';

checkIsOnBoardingVisited() =>
    getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
