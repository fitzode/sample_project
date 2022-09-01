import 'package:flutter/material.dart';
import 'package:test_app/utils/string_helper.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final double textfieldWidth;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.title,
      required this.textfieldWidth,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Can't be empty";
              }
              return null;
            },
            decoration: InputDecoration(
                errorText: StringHelper.validatePassword(controller.text),
                contentPadding: EdgeInsets.symmetric(vertical: 16)),
          ),
        ),
      ],
    );
  }
}
