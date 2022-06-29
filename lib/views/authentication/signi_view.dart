import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/forgot_password/forgotpassword_view.dart';
import 'package:user_auth_app/views/signup/signup_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/app_textfield.dart';
import 'package:user_auth_app/widgets/fb_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.heading("Let's SIgn You In "),
                  AppText.caption(
                    "Welcome back, you have been missed",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    type: InputType.username,
                  ),
                  AppTextField(
                    type: InputType.password,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const AppButtom(
                    text: "SIGN IN",
                    icon: Icons.login_outlined,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.caption("Don't have an account?  "),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordView())),
                        child: AppText.caption(
                          "Sign up",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordView())),
                    child: AppText.caption(
                      "Forgot password",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordView(),
                          )),
                      child: const FbButton())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
