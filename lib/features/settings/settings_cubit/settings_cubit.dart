import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/functions/custom_toast.dart';
import '../../../core/utils/app_colors.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void sendEmail({required String emailAddress}) async {
    final email = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: 'subject=Support&body=Hi, i need help',
    );
    if (await canLaunchUrl(email)) {
      launchUrl(email);
    } else {
      showToast("Could not launch $email", AppColors.primaryColor);
    }
  }

  void openWhatsapp({required String number}) async {
    var whatsapp = number; //+201xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatsappURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        showToast("Whatsapp not installed", AppColors.primaryColor);
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        showToast("Whatsapp not installed", AppColors.primaryColor);
      }
    }
  }
}
