import 'package:flutter/material.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_contact_item.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: CustomContactItem(),
        );
      }),
    );
  }
}
