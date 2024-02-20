import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
      this.isShow = false,
  }) : super(key: key);
  
final TextEditingController controller;
final String labelText;
final bool isShow;  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isShow ? true : false, 
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
