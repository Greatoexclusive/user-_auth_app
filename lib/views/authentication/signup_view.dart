import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/core/services/auth_service.dart';
import 'package:user_auth_app/utils/text.dart';
import 'package:user_auth_app/views/authentication/sigin_view.dart';
import 'package:user_auth_app/views/dashboard/dashboard_view.dart';
import 'package:user_auth_app/widgets/app_buttom.dart';
import 'package:user_auth_app/widgets/app_textfield.dart';
import 'package:user_auth_app/widgets/fb_button.dart';
import 'package:user_auth_app/widgets/loader.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

AuthServices _authServices = AuthServices();
bool isLoading = false;
bool result = false;
TextEditingController _firstnameController = TextEditingController();
TextEditingController _lastnameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class _SignUpViewState extends State<SignUpView> {
  signUp() async {
    isLoading = true;
    setState(() {});
    print("about to verify");
    result = await _authServices.signUp(
      firstname: _firstnameController.text,
      lastname: _lastnameController.text,
      email: widget.email,
      phone: _phoneController.text,
      password: _passwordController.text,
    );
    print(_passwordController.text);
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading("One last step to go, 😉 "),
                      AppText.caption(
                        "Choose a username and password for your account!",
                      ),
                      AppTextField(
                        controller: _firstnameController,
                        type: InputType.firstname,
                      ),
                      AppTextField(
                        controller: _lastnameController,
                        type: InputType.lastname,
                      ),
                      AppTextField(
                        controller: _passwordController,
                        type: InputType.password,
                      ),
                      AppTextField(
                        controller: _phoneController,
                        type: InputType.phone,
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
                      AppButtom(
                        onPressed: () async {
                          await signUp();
                          if (result) {
                            final snack = SnackBar(
                              backgroundColor: Colors.green,
                              elevation: 5,
                              duration: const Duration(seconds: 4),
                              content: AppText.caption(
                                "Sign Up Successful!",
                                color: Colors.white,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardView(),
                              ),
                            );
                          } else {
                            final snack = SnackBar(
                              backgroundColor: Colors.red,
                              elevation: 5,
                              duration: const Duration(seconds: 4),
                              content: AppText.caption(
                                "SOmething went wrong, kindly try again!",
                                color: Colors.white,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          }
                        },
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
        ),
        Loader(isLoading: isLoading)
      ],
    );
  }
}
