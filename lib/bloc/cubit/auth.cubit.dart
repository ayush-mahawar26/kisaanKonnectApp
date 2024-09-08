import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/bloc/states/auth.state.dart';
import 'package:kisaan_konnect/services/auth.service.dart';
import 'package:kisaan_konnect/utils/reg_check.dart';
import 'package:kisaan_konnect/utils/shared_pref.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  void getUser(String token) async {
    emit(LoadingAuthState());
    try {
      String? token = await SharedPrefService().getData('token');
    } catch (e) {
      emit(ErrorAuthState(err: "unable to get user from token"));
    }
  }

  void signupUser(String fullName, String email, String pass) async {
    emit(LoadingAuthState());

    try {
      Response? response =
          await AuthService().signupUser(fullName, email, pass);
      if (response == null) {
        emit(ErrorAuthState(err: "Response is null"));
      } else {
        Map<String, dynamic> res = await jsonDecode(response.body);
        print(res);
        if (res['token'] != null) {
          emit(DoneAuthState(userToken: res['token']!));
        } else {
          emit(ErrorAuthState(err: res['message']));
        }
      }
    } catch (e) {
      emit(ErrorAuthState(err: "Error Occured"));
    }
  }

  void signinUser(String email, String pass) async {
    emit(LoadingAuthState());

    try {
      Response? response = await AuthService().signinUser(email, pass);
      if (response == null) {
        emit(ErrorAuthState(err: "Response is null"));
      } else {
        Map<String, dynamic> res = await jsonDecode(response.body);
        print(res);
        if (res['token'] != null) {
          emit(DoneAuthState(userToken: res['token']!));
        } else {
          emit(ErrorAuthState(err: res['message']));
        }
      }
    } catch (e) {
      emit(ErrorAuthState(err: "Error Occured"));
    }
  }
}
