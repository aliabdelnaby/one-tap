import 'package:one_tap/core/cache/cache_helper.dart';

checkIsOnBoardingVisited() =>
    CacheHelper().getData(key: "isOnBoardingVisited") ?? false;
