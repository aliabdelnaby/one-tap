import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:via_whatsapp/core/functions/custom_toast.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  GlobalKey<FormState> phoneFormKey = GlobalKey();
  void openWhatsapp(
      {required BuildContext context, required String number}) async {
    var whatsapp = number; //+201xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatsappURLIos = "https://wa.me/$whatsapp";
    try {
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
          await launchUrl(Uri.parse(whatsappURLIos));
        } else {
          showToast("Whatsapp not installed", Colors.red);
        }
      } else {
        // android , web
        if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
          await launchUrl(Uri.parse(whatsappURlAndroid));
        } else {
          showToast("Whatsapp not installed", Colors.red);
        }
      }
    } catch (e) {
      showToast(e.toString(), Colors.red);
    }
  }
}
