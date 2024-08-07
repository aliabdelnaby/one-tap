import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/functions/custom_toast.dart';
import 'home_state.dart';
import 'package:flutter/services.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  GlobalKey<FormState> phoneFormKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  String? phone;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Future<void> openWhatsapp({required String number}) async {
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

  Future<void> addContact(ContactModel contact) async {
    try {
      emit(AddContactLoading());
      var contactsBox = Hive.box<ContactModel>(kContacts);
      await contactsBox.add(contact);
      emit(AddContactSuccess());
    } catch (e) {
      emit(AddContactFailure(errMessage: e.toString()));
    }
  }

  List<ContactModel>? contacts;
  fetchAllContacts() async {
    var contactsBox = Hive.box<ContactModel>(kContacts);
    contacts = contactsBox.values.toList();
    emit(ContactstSuccess());
  }

  Future<void> deleteAllData() async {
    try {
      emit(DeleteAllContactsLoading());
      var contactsBox = Hive.box<ContactModel>(kContacts);
      await contactsBox.clear();
      emit(DeleteAllContactstSuccess());
    } catch (e) {
      emit(DeleteAllContactsFailure(errMessage: e.toString()));
    }
  }

  Future<void> makeCall({required String phone}) async {
    var phoneNumber = phone; //+201xx enter like this
    final call = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      showToast("Could not launch $call", AppColors.primaryColor);
    }
  }

  Future<void> checkClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      String clipboardText = data.text!;
      phoneController.text = clipboardText;
    }
  }

  removeSpaces() {
    phoneController.addListener(() {
      final text = phoneController.text;
      phoneController.value = phoneController.value.copyWith(
        text: text.replaceAll(' ', ''), // Remove spaces
      );
    });
  }

  Future<void> changeLanguageToEnglish(BuildContext context) async {
    try {
      emit(ChangeLanguageLoading());
      Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
      if (currentLocal != const Locale("en")) {
        customSnackBar(
          context,
          "The language has been changed",
          AppColors.green,
        );
        await EasyLocalization.of(context)!.setLocale(const Locale("en"));
        emit(ChangeLanguageSuccess());
      } else {
        emit(ChangeLanguageFailure(
            errMessage: "You are on the same language".tr()));
      }
    } catch (e) {
      emit(ChangeLanguageFailure(errMessage: e.toString()));
    }
  }

  Future<void> changeLanguageToArabic(BuildContext context) async {
    try {
      emit(ChangeLanguageLoading());
      Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
      if (currentLocal != const Locale("ar")) {
        customSnackBar(
          context,
          "تم تغيير اللغة",
          AppColors.green,
        );
        await EasyLocalization.of(context)!.setLocale(const Locale("ar"));
        emit(ChangeLanguageSuccess());
      } else {
        emit(ChangeLanguageFailure(
            errMessage: "You are on the same language".tr()));
      }
    } catch (e) {
      emit(ChangeLanguageFailure(errMessage: e.toString()));
    }
  }
}
