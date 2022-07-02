import 'package:flutter/material.dart';
import 'package:user_auth_app/views/authentication/signup_view.dart';
import 'package:user_auth_app/views/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      home: OnBoardingView(),
    );
  }
}
