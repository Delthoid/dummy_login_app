import 'package:dummy_login_app/models/login_model.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  late LoginModel loginData;
  int status = 0;
  String? errorMsg;

  void login({
    required String email,
    required password,
  }) {
    password == ''
        ? loginData = LoginModel(email: email)
        : loginData = LoginModel(email: email, password: password);
    _authenticate(loginData);
  }

  Future<void> _authenticate(LoginModel _login) async {
    var response = await http.post(Uri.parse('https://reqres.in/api/login'),
        body: _login.toMap());
    if(response.statusCode == 200){
      status = response.statusCode;
    }
    else{
      status = response.statusCode;
      errorMsg = 'bobo';
    }
    notifyListeners();
  }
}
