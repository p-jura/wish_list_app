import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String textlabel;
  const CustomTextFormField({required this.textlabel ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(),
        ),
        label: Text(textlabel),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}
