import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/functions/custom_toast.dart';
import '../../../core/utils/app_colors.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  Future<void> sendEmail() async {
    try {
      emit(SendEmailLoading());
      final email = Uri(
        scheme: 'mailto',
        path: 'aliabdelnabi239@gmail.com',
        query: 'subject=Support&body=Hi, i need help',
      );
      if (await canLaunchUrl(email)) {
        launchUrl(email);
      } else {
        showToast("Could not launch $email", AppColors.primaryColor);
      }
      emit(SendEmailSuccess());
    } catch (e) {
      emit(SendEmailFailure(errMessage: e.toString()));
      showToast(e.toString(), AppColors.primaryColor);
    }
  }
  
}
