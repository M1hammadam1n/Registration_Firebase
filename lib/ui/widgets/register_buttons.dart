import 'package:flutter/material.dart';

class RagisterButtons extends StatelessWidget {
  const RagisterButtons({
    Key? key,
    required this.btnStyle,
    required this.textStyle,
    required this.btnName,
    required this.func,
  }) : super(key: key);
  final ButtonStyle btnStyle;
  final TextStyle textStyle;
  final String btnName;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: btnStyle,
      onPressed: () {
        func.call();
      },
      child: Text(
        btnName,
        style: textStyle,
      ),
    );
  }
}
