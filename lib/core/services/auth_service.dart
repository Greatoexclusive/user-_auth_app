import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_auth_app/core/constants/api_routes.dart';

class AuthServices {
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

  Future<bool> verifyOtp({
    required String email,
    required String pin,
  }) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "pin": pin,
      };
      print(ApiRoutes.baseUrl + ApiRoutes.verifyOtp);
      http.Response response = await http.post(
          Uri.parse(
            ApiRoutes.baseUrl + ApiRoutes.verifyOtp,
          ),
          body: body);
      final result = jsonDecode(response.body)["verified"];
      print(result);
      print(response.body);
      return result;
    } catch (e) {
      print("Error is $e");
      return false;
    }
  }
}
