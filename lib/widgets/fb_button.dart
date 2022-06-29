import 'package:flutter/material.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';

class FbButton extends StatelessWidget {
  const FbButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: fbColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.facebook,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          AppText.regular(
            "Connect with Facebook",
          ),
        ],
      ),
    );
  }
}
