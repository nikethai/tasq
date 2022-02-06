import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/constant/Strings.dart';
import 'package:tasq/views/home_page.dart';
import 'package:tasq/views/sign_up_page.dart';
import 'package:tasq/widgets/account_button.dart';
import 'package:tasq/widgets/top_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: <Widget>[
            TopNavBar(context: context),
            Text(
              Strings.LOGIN_INTRODUCTION_TITLE,
              style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )
                .alignment(Alignment.centerLeft)
                .padding(top: screenHeight * 0.035, left: 10),
            Text(
              Strings.LOGIN_INTRODUCTION_CONTENT,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: const Color(0xFF5A5F66)),
            ).alignment(Alignment.centerLeft).padding(top: 5, left: 10),
            SizedBox(
              width: screenWidth * 0.9,
              child: FormBuilder(
                  key: _formKey,
                  child: <Widget>[
                    FormBuilderTextField(
                      name: "username",
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          labelText: "Tên tài khoản"),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Vui lòng nhập vào ô này";
                        }
                      },
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.lock_sharp),
                          ),
                          labelText: "Mật khẩu"),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Vui lòng nhập vào ô này";
                        }
                      },
                    )
                  ].toColumn()),
            ).padding(top: screenHeight * 0.08),
            AccountButton(
              onTap: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.saveAndValidate()) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false);
                }
              },
              text: Text(
                Strings.LOGIN,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              color: const Color(0xFF00629E),
            ).padding(top: screenHeight * 0.2),
            AccountButton(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignUpPage())),
              text: Text(
                Strings.PROMPT_SIGN_UP,
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ).padding(top: screenHeight * 0.02),
          ].toColumn(),
        )));
  }
}
