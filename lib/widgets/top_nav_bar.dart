import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/constant/Strings.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        const Icon(
          Icons.arrow_back_ios_new,
          size: 13,
          color: Colors.grey,
        ).padding(right: 15),
        Text(
          Strings.BACK_BUTTON_TEXT,
          style: GoogleFonts.nunito(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ].toRow().padding(vertical: 16, horizontal: 8).gestures(
            onTap: () => Navigator.pop(context),
          ),
      const Image(
        image: AssetImage("assets/png/logo.png"),
        width: 64,
      ).padding(top: 5, right: 8).alignment(Alignment.topRight),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
