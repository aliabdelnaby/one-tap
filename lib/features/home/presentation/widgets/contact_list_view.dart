import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/contact_model.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import '../../cubits/home_cubit/home_state.dart';
import 'custom_contact_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<ContactModel> contacts =
            BlocProvider.of<HomeCubit>(context).contacts!;
        if (contacts.isNotEmpty) {
          return ListView.builder(
            itemCount: contacts.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomContactItem(contact: contacts[index]),
              );
            }),
          );
        } else {
          return Center(
            child: Text(
              "No Conversations yet".tr(),
            ),
          );
        }
      },
    );
  }
}
