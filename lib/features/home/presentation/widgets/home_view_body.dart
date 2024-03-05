import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/features/home/presentation/widgets/clear_all_alert_dialog.dart';
import '../../../../core/functions/custom_toast.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import '../../cubits/home_cubit/home_state.dart';
import 'contact_list_view.dart';
import 'custom_enter_mobile_nember_and_open_tele_whatsapp.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is AddContactFailure) {
                showToast(state.errMessage, AppColors.primaryColor);
              } else if (state is AddContactSuccess) {
                cubit.fetchAllContacts();
              }
            },
            builder: (context, state) {
              return const EnterMobileNumberSection();
            },
          ),
          const SizedBox(height: 20),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Conversation".tr(),
                style: CustomTextStyle.signikastyle18,
              ),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is DeleteAllContactsFailure) {
                    showToast(state.errMessage, AppColors.primaryColor);
                  } else if (state is DeleteAllContactstSuccess) {
                    cubit.fetchAllContacts();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "All deleted successfully".tr(),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return TextButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomAlertDialogClearAll(cubit: cubit);
                          });
                    },
                    label: Text(
                      "Clear All".tr(),
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.grey,
                      size: 18,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
