import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:one_tap/core/cache/cache_helper.dart';
import 'package:one_tap/core/functions/navigation.dart';
import 'package:one_tap/core/services/service_locator.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/onBoarding/presentation/widgets/pages_list.dart';

class OnBoardnigView extends StatelessWidget {
  const OnBoardnigView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: pages,
          onDone: () {
            getIt<CacheHelper>()
                .saveData(key: "isOnBoardingVisited", value: true);
            customReplacementNavigate(context, "/homeView");
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
      activeShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
    );
  }
}
