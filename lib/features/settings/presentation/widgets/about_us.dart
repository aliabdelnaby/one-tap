import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About This Application'.tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'description'.tr(),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Features'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'features'.tr(),
              style: const TextStyle(fontSize: 16.0),
            ),
            // const Text(
            //   '- Efficient Communication: Facilitates quick communication with contacts through WhatsApp.',
            //   style: TextStyle(fontSize: 16.0),
            // ),
            // const Text(
            //   '- User-Friendly Interface: Simple and intuitive design for smooth navigation.',
            //   style: TextStyle(fontSize: 16.0),
            // ),
            // const Text(
            //   '- Save your time: This is an easy way to connect with people without saving the contact.',
            //   style: TextStyle(fontSize: 16.0),
            // ),
            const SizedBox(height: 20.0),
            Text(
              'Usage'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'usage'.tr(),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Developer'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'developer'.tr(),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Feedback'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'feedback'.tr(),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'ThankYouMessage'.tr(),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
