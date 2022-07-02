import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/core/services/auth_service.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/authentication/forgotpassword_view.dart';
import 'package:user_auth_app/views/authentication/otp_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/app_textfield.dart';
import 'package:user_auth_app/widgets/loader.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

AuthServices _authServices = AuthServices();
bool isLoading = false;
bool result = false;
TextEditingController _emailController = TextEditingController();

class _VerifyEmailViewState extends State<VerifyEmailView> {
  verifyEmail() async {
    isLoading = true;
    setState(() {});
    print("about to verify");
    result = await _authServices.verifyEmail(email: _emailController.text);
    print("out already");
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    AppText.heading("Let's verify your email 😊"),
                    AppText.caption(
                      "Just a few steps to go...",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: _emailController,
                      type: InputType.email,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Spacer(),
                    AppButtom(
                      onPressed: () async {
                        await verifyEmail();
                        if (result) {
                          print("already here");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpView(
                                email: _emailController.text,
                              ),
                            ),
                          );
                        }
                      },
                      text: "CONTINUE",
                      icon: Icons.login_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.caption("Have an account?  "),
                        InkWell(
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordView())),
                          child: AppText.caption(
                            "Sign in",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Loader(isLoading: isLoading)
        ],
      ),
    );
  }
}
