import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/otp/otp_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/app_textfield.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordView();
}

class _ForgotPasswordView extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(
                height: 40,
              ),
              AppText.heading("Password Recovery"),
              AppText.caption(
                "Enter your email to recover your password",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                type: InputType.email,
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 40,
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const OtpView())),
                child: const AppButtom(
                  text: "CONTINUE",
                  icon: Icons.arrow_right_alt,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
