import 'package:flutter/material.dart';

Widget customTextFeild(BuildContext context, TextEditingController controller,
    String title, String hint,
    {bool isPass = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    child: TextFormField(
      controller: controller,
      obscureText: isPass,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(),
      decoration: InputDecoration(
        label: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        hintText: hint,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
      ),
    ),
  );
}
