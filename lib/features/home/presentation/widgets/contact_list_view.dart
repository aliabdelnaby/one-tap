import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/models/contact_model.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_state.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_contact_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<ContactModel> contacts =
            BlocProvider.of<HomeCubit>(context).contacts!;
        return ListView.builder(
          itemCount: contacts.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CustomContactItem(),
            );
          }),
        );
      },
    );
  }
}
