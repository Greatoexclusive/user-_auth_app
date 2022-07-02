import 'package:flutter/material.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/authentication/forgotpassword_view.dart';
import 'package:user_auth_app/views/authentication/sigin_view.dart';
import 'package:user_auth_app/views/authentication/verifyemail_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/fb_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                AppText.heading("Welcome on Board"),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                AppButtom(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyEmailView())),
                    text: "SIGN UP",
                    icon: Icons.login_outlined),
                const SizedBox(
                  height: 20,
                ),
                AppButtom.outlined(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView())),
                    text: "LOGIN",
                    icon: Icons.login_outlined),
                const SizedBox(
                  height: 20,
                ),
                // InkWell(
                //   onTap: () => Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const ForgotPasswordView(),
                //       )),
                //   child: const FbButton(),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
