import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:one_tap/core/functions/navigation.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/core/utils/assets.dart';

class OnBoardnigView extends StatelessWidget {
  const OnBoardnigView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Sending a Message'.tr(),
              body: 'With one click you can start a conversation'.tr(),
              image: buildImage(
                Assets.imagesOnboarding1,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Your time is important.'.tr(),
              body:
                  'Save your time. There is no need to waste time saving the number and then opening WhatsApp or telegram.'
                      .tr(),
              image: buildImage(
                Assets.imagesOnboarding2,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Save contacts.'.tr(),
              body:
                  'The time and date of each contact you open will be temporarily stored for you for easy reference and you can delete them.'
                      .tr(),
              image: buildImage(
                Assets.imagesOnboarding3,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Privacy',
              body:
                  'All your conversations are confidential, and the application does not save any messages or contacts.Body of 3rd Page',
              image: buildImage(
                Assets.imagesOnboarding4,
              ),
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            customReplacementNavigate(context, "/homeView");
          },
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: CustomTextStyle.signikaBtnstyle17,
          ),
          next: Icon(
            Icons.forward,
            color: AppColors.primaryColor,
          ),
          done: Text(
            "Done",
            style: CustomTextStyle.signikaBtnstyle17,
          ),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  //! widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
      child: SvgPicture.asset(
        imagePath,
        width: 450.w,
        height: 200.h,
      ),
    );
  }

  //! method to customise the page style
  PageDecoration getPageDecoration() {
    return PageDecoration(
      imagePadding: EdgeInsets.only(top: 120.h),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8.h, left: 20.w, right: 20.w),
      titlePadding: EdgeInsets.only(top: 50.h),
      titleTextStyle: CustomTextStyle.signikastyle20,
      bodyTextStyle: CustomTextStyle.signikastyle15black54,
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
