import 'package:flutter/material.dart';
import 'package:user_auth_app/core/services/auth_service.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/authentication/signup_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:user_auth_app/widgets/loader.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<OtpView> createState() => _OtpView();
}

AuthServices _authServices = AuthServices();
TextEditingController otpController = TextEditingController();
bool isLoading = false;
bool result = false;

class _OtpView extends State<OtpView> {
  verifyOtp() async {
    isLoading = true;
    setState(() {});
    print("about to verify");
    result = await _authServices.verifyOtp(
      email: widget.email,
      pin: otpController.text,
    );
    print("out already");
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  const SizedBox(
                    height: 40,
                  ),
                  AppText.heading("OTP Authentication"),
                  AppText.caption(
                    "An authentication code was sent to ${widget.email}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    // key: model.formkey,
                    child: PinCodeTextField(
                      controller: otpController,
                      appContext: context,
                      length: 6,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "OTP Code cannot be empty";
                        } else if (value.length < 6) {
                          return "Please completly fill your OTP code";
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldWidth: 45,
                        inactiveColor: Colors.grey,
                        activeColor: kPrimaryColor,
                        selectedColor: kPrimaryLightColor,
                        errorBorderColor: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Spacer(),
                  AppButtom(
                    onPressed: () async {
                      await verifyOtp();
                      if (result) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ),
                        );
                      } else {
                        final snack = SnackBar(
                          backgroundColor: Colors.red,
                          elevation: 5,
                          duration: const Duration(seconds: 4),
                          content: AppText.caption(
                            "Could not validate the otp you entered, kindly try again!",
                            color: Colors.white,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    },
                    text: "CONTINUE",
                    icon: Icons.arrow_right_alt,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Loader(isLoading: isLoading)
      ],
    );
  }
}
