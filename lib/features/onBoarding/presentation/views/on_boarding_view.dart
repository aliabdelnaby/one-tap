import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/pages_list.dart';

class OnBoardnigView extends StatelessWidget {
  const OnBoardnigView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: IntroductionScreen(
          pages: pages,
          onDone: () {
            getIt<CacheHelper>()
                .saveData(key: "isOnBoardingVisited", value: true);
            GoRouter.of(context).pushReplacement("/homeView");
          },
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: Text(
            "Skip".tr(),
            style: CustomTextStyle.signikaBtnstyle17,
          ),
          next: Icon(
            Icons.forward,
            color: AppColors.primaryColor,
          ),
          done: Text(
            "Get Started".tr(),
            style: CustomTextStyle.signikaBtnstyle17,
          ),
          dotsDecorator: getDotsDecorator(),
          globalBackgroundColor: AppColors.white,
        ),
      ),
    );
  }

  //! method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2.w),
      activeColor: AppColors.primaryColor,
      color: Colors.grey,
      activeSize: Size(10.sp, 10.sp),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0.r),
        ),
      ),
    );
  }
}
