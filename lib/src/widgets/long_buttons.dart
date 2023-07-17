import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {super.key, required this.buttonTitle, required this.buttonColor, required this.onTap});

  final String buttonTitle;
  final Color buttonColor;
 final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height * 0.06,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: Text(
          buttonTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
