import 'package:flutter/material.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpView();
}

class _OtpView extends State<OtpView> {
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
              AppText.heading("OTP Authentication"),
              AppText.caption(
                "An authenticationcode has been sent to name@gmail.com",
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Container(
                      child: Center(child: AppText.heading(index.toString())),
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 40,
              ),
              const Spacer(),
              const AppButtom(
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
    );
  }
}
