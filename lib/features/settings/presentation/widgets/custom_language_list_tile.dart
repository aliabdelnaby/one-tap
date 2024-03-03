import 'package:flutter/material.dart';

class CustomLanguageListTile extends StatelessWidget {
  const CustomLanguageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: const Icon(
          Icons.language,
          color: Colors.red,
        ),
      ),
      title: const Text(
        "Language",
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
