import 'package:flutter/material.dart';

class CustomSupportListTile extends StatelessWidget {
  const CustomSupportListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: const Icon(
          Icons.support_agent_outlined,
          color: Colors.red,
        ),
      ),
      title: const Text(
        "Support",
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
