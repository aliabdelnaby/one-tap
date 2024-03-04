import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/functions/custom_toast.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  GlobalKey<FormState> phoneFormKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  String? phone;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> openWhatsapp(
      {required BuildContext context, required String number}) async {
    try {
      emit(OpenWhatsAppLoading());
      var whatsapp = number; //+201xx enter like this
      var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
      var whatsappURLIos = "https://wa.me/$whatsapp";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
          await launchUrl(Uri.parse(whatsappURLIos));
        } else {
          showToast("Whatsapp not installed".tr(), Colors.red);
        }
      } else {
        // android , web
        if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
          await launchUrl(Uri.parse(whatsappURlAndroid));
        } else {
          showToast("Whatsapp not installed".tr(), Colors.red);
        }
      }
      emit(OpenWhatsAppSuccess());
    } catch (e) {
      emit(OpenWhatsAppFailure(errMessage: e.toString()));
      showToast(e.toString(), Colors.red);
    }
  }

  Future<void> openTelegram({required String phone}) async {
    try {
      emit(OpenTelegramLoading());
      var teleNumber = phone; //+201xx enter like this
      var teleURlAndroid = "https://t.me/$teleNumber";
      var teleURLIos = "https://t.me/$teleNumber";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunchUrl(Uri.parse(teleURLIos))) {
          await launchUrl(Uri.parse(teleURLIos));
        } else {
          showToast("Telegram not installed"..tr(), Colors.red);
        }
      } else {
        // android , web
        if (await canLaunchUrl(Uri.parse(teleURlAndroid))) {
          await launchUrl(Uri.parse(teleURlAndroid));
        } else {
          showToast("Telegram not installed".tr(), Colors.red);
        }
      }
      emit(OpenTelegramSuccess());
    } catch (e) {
      emit(OpenTelegramFailure(errMessage: e.toString()));
      showToast(e.toString(), Colors.red);
    }
  }
}
