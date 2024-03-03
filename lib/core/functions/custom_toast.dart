import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';

showToast(String msg, Color? backgroundColor) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor ?? AppColors.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
