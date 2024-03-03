
import 'package:flutter/material.dart';

class CustomAboutListTile extends StatelessWidget {
  const CustomAboutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: const Icon(
          Icons.info_outline,
          color: Colors.red,
        ),
      ),
      title: const Text(
        "About",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}