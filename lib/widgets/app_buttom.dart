import 'package:flutter/material.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';

class AppButtom extends StatelessWidget {
  const AppButtom({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              kPrimaryLightColor,
              kPrimaryColor,
            ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryLightColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 25,
          ),
          AppText.regular(
            text,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          )
        ],
      ),
    );
  }
}
