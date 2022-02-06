import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/constant/Strings.dart';
import 'package:tasq/views/login_page.dart';
import 'package:tasq/views/sign_up_page.dart';
import 'package:tasq/widgets/account_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: <Widget>[
        const Image(
          image: AssetImage("assets/png/logo.png"),
          width: 64,
        )
            .padding(top: screenHeight * 0.025, left: 10)
            .alignment(Alignment.topLeft),
        Image(
          image: const AssetImage("assets/png/bg-transparent.png"),
          width: screenWidth,
        ).padding(top: screenHeight * 0.075),
        Text(
          Strings.WELCOME_INTRO,
          style: GoogleFonts.nunito(fontSize: 36, fontWeight: FontWeight.w900),
        ).padding(top: screenHeight * 0.05, horizontal: 30),
        AccountButton(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const LoginPage())),
          text: Text(
            Strings.LOGIN,
            style:
                GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ).padding(top: screenHeight * 0.075),
        AccountButton(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpPage())),
          text: Text(
            Strings.SIGN_UP,
            style: GoogleFonts.nunito(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          color: const Color(0xFF00629E),
        ).padding(top: screenHeight * 0.02),
      ].toColumn()),
    );
  }
}
