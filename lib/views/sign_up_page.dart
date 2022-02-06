import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/constant/Strings.dart';
import 'package:tasq/widgets/account_button.dart';
import 'package:tasq/widgets/top_nav_bar.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: <Widget>[
            TopNavBar(context: context),
            RichText(
                    text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: Strings.SIGN_UP_INTRODUCTION,
                style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextSpan(
                text: " tasq",
                style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1C63BB)),
              )
            ]))
                .alignment(Alignment.centerLeft)
                .padding(top: screenHeight * 0.035, left: 10),
            Text(
              Strings.SIGN_UP_CONTENT,
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
                    ),
                    FormBuilderTextField(
                      name: 'confirm_password',
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.lock_sharp),
                          ),
                          labelText: "Xác nhận mật khẩu"),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Vui lòng nhập vào ô này";
                        } else if (_formKey
                                .currentState?.fields["password"]?.value !=
                            val) {
                          return "Mật khẩu không khớp";
                        }
                      },
                    ),
                  ].toColumn()),
            ).padding(top: screenHeight * 0.08),
            AccountButton(
              onTap: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.saveAndValidate()) {}
              },
              text: Text(
                Strings.SIGN_UP,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              color: const Color(0xFF00629E),
            ).padding(top: screenHeight * 0.12),
            AccountButton(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage())),
              text: Text(
                Strings.PROMPT_LOGIN,
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ).padding(top: screenHeight * 0.02),
          ].toColumn(),
        )));
  }
}
