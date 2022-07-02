import 'package:flutter/material.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';

class AppButtom extends StatelessWidget {
  const AppButtom({
    Key? key,
    required this.text,
    required this.icon,
    this.enabledBorder = false,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool? enabledBorder;
  final Function()? onPressed;

  AppButtom.outlined({
    Key? key,
    required this.text,
    required this.icon,
    this.enabledBorder = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 45,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: enabledBorder!
                  ? [
                      const Color(0x00000000),
                      const Color(0x00000000),
                    ]
                  : [
                      kPrimaryLightColor,
                      kPrimaryColor,
                    ],
              stops: [0.0, 1.0],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
            border: Border.all(
                color: enabledBorder! ? kPrimaryColor : Colors.transparent,
                width: 2),
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
              color: enabledBorder! ? kPrimaryColor : Colors.white,
            ),
            Icon(
              icon,
              color: enabledBorder! ? kPrimaryColor : Colors.white,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
