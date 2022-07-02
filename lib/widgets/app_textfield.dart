import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/textfieldtype_keys.dart';
import 'package:user_auth_app/core/constants/textstyle.dart';
import 'package:user_auth_app/utils/color.dart';
import 'package:user_auth_app/utils/text.dart';

class AppTextField extends StatelessWidget {
  AppTextField({Key? key, required this.type, required this.controller})
      : super(key: key);
  String type;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -6,
            blurRadius: 1,
            offset: const Offset(0, 7),
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.caption(type == InputType.email
              ? "Email"
              : type == InputType.password
                  ? "Password"
                  : type == InputType.username
                      ? "Username"
                      : type == InputType.phone
                          ? "PhoneNUmber"
                          : ""),
          Row(
            children: [
              Icon(type == InputType.email
                  ? Icons.mail_outline
                  : type == InputType.password
                      ? Icons.lock_outline
                      : type == InputType.username
                          ? Icons.person_outline
                          : Icons.circle),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextFormField(
                controller: controller,
                style: input,
                maxLines: 1,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "name@gmail.com",
                  hintStyle: TextStyle(fontSize: 20, color: kGrey),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
