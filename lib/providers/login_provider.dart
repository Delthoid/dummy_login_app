import 'package:dummy_login_app/models/error_msg.dart';
import 'package:dummy_login_app/models/login_model.dart';
import 'package:dummy_login_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  late LoginModel loginData;
  int status = 0;
  String errorMsg = '';
  bool isLoading = false;

  void login({
    required String email,
    required password,
    required BuildContext context,
  }) async {
    password == ''
        ? loginData = LoginModel(email: email)
        : loginData = LoginModel(email: email, password: password);
    _authenticate(loginData, context);
    notifyListeners();
  }

  Future<void> _authenticate(LoginModel _login, BuildContext context) async {
    isLoading = true;
    var response = await http.post(Uri.parse('https://reqres.in/api/login'),
        body: _login.toMap());

    Future.delayed(const Duration(seconds: 2));
    if (response.statusCode == 200) {
      status = response.statusCode;
      isLoading = true;
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    } else {
      status = response.statusCode;
      errorMsg = errorMsgModelFromMap(response.body).error;
      _showErrorDialog(context, errorMsg);
      isLoading = false;
    }
    notifyListeners();
  }

  _showErrorDialog(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: Text(error),
          ),
        );
      },
    );
  }
}
