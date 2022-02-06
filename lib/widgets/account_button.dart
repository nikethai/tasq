import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final Color? color;
  final Text? text;
  final void Function()? onTap;
  const AccountButton({Key? key, this.onTap, this.color, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenHeight * 0.5,
        height: 70,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: const Color(0xFFC4C4C4), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(21))),
        alignment: Alignment.center,
        child: text,
      ),
    );
  }
}
