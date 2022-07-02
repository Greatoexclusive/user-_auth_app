import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_auth_app/core/constants/api_routes.dart';
import 'package:user_auth_app/views/authentication/otp_view.dart';

class AuthServices {
  ///send an otp to the email passed
  Future<bool> verifyEmail({
    required String email,
  }) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
      };
      http.Response response = await http.post(
          Uri.parse(
            ApiRoutes.baseUrl + ApiRoutes.verifyEmail,
          ),
          body: body);
      print(response.body);
      return true;
    } catch (e) {
      print("Error is $e");
      return false;
    }
  }

  ///verifies if the otp sent is correctly entered by the user
  Future<bool> verifyOtp({
    required String email,
    required String pin,
  }) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "pin": pin,
      };
      // print(ApiRoutes.baseUrl + ApiRoutes.verifyOtp);
      http.Response response = await http.post(
          Uri.parse(
            ApiRoutes.baseUrl + ApiRoutes.verifyOtp,
          ),
          body: body);
      final result = jsonDecode(response.body)["verified"];
      // print(result);
      // print(response.body);
      return result;
    } catch (e) {
      print("Error is $e");
      return false;
    }
  }

  /// creates an account for a verified user
  Future<bool> signUp({
    required String firstname,
    required String lastname,
    required String phone,
    required String password,
    required String email,
  }) async {
    try {
      print("in this service to sgn up now");
      Map<String, dynamic> body = {};
      body["email"] = email;
      body["first_name"] = firstname;
      body["last_name"] = lastname;
      body["password"] = password;
      body["phone"] = phone;
      print("in this service to sgn up now");

      print(body);
      http.Response response = await http.post(
        Uri.parse(
          ApiRoutes.baseUrl + ApiRoutes.signUp,
        ),
        body: body,
      );
      print(response.body);

      final result = (response.statusCode) == 201 ? true : false;
      return result;
    } catch (e) {
      print("Error is $e");
      return false;
    }
  }
}
