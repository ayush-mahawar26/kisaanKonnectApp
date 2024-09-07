import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/constants/global.constants.dart';

class AuthService {
  Future<Response?> signupUser(
      String fullName, String email, String pass) async {
    try {
      Response res = await post(
        Uri.parse('${GlobalConstants.url}/user/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'fullName': fullName,
          'useremail': email,
          'password': pass
        }),
      );

      return res;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> signinUser(String email, String pass) async {
    try {
      Response res = await post(
        Uri.parse('${GlobalConstants.url}/user/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'useremail': email,
          'password': pass,
        }),
      );

      return res;
    } catch (e) {
      return null;
    }
  }
}
