import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/models/contact_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../cubits/home_cubit/home_cubit.dart';

class CustomContactItem extends StatelessWidget {
  const CustomContactItem({super.key, required this.contact});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return GestureDetector(
      onTap: () {
        if (contact.iconCode == FontAwesomeIcons.whatsapp.codePoint) {
          cubit.openWhatsapp(number: contact.number);
        } else if (contact.iconCode == FontAwesomeIcons.telegram.codePoint) {
          cubit.openTelegram(phone: contact.number);
        } else if (contact.iconCode == FontAwesomeIcons.phone.codePoint) {
          cubit.makeCall(phone: contact.number);
        }
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: ListTile(
          title: Text(
            contact.number,
          ),
          subtitle: Text(
            contact.date,
            style: CustomTextStyle.signikaTimestyle,
          ),
          leading: CircleAvatar(
            backgroundColor: AppColors.grey200,
            child: Icon(
              IconDataBrands(
                contact.iconCode,
              ),
              color: AppColors.primaryColor,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              contact.delete();
              BlocProvider.of<HomeCubit>(context).fetchAllContacts();
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
