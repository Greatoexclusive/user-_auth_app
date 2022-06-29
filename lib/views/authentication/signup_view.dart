import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/signin/signi_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/app_textfield.dart';
import 'package:user_auth_app/widgets/fb_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                  AppText.heading("Getting Started"),
                  AppText.caption(
                    "Create an account to continue!",
                  ),
                  AppTextField(
                    type: InputType.email,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_box_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: AppText.caption(
                            "By creating an account, you agree to our Terms and Conditions",
                            height: 1.3,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const AppButtom(
                    text: "SIGN UP",
                    icon: Icons.login_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.caption("Already have an account?  "),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInView())),
                        child: AppText.caption(
                          "Sign In",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const FbButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
