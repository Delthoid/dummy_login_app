import 'dart:convert';
import 'dart:math';

import 'package:dummy_login_app/models/login_model.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var result = 'WAIT';

  void _submitLogin(String email, String password){
    LoginProvider prov= Provider.of<LoginProvider>(context, listen: false);
    prov.login(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _submitLogin(emailController.text, passwordController.text);
                  //signIn(emailController.text, passwordController.text);
                },
                child: const Text('Test'),
              ),
              Text('result $result'),
              Consumer<LoginProvider>(
                builder: (context, login, child){
                  var result = Text('data');
                  login.status == 200 //success
                  ? result = Text('STATUS CODE ' + login.status.toString())
                  : result = Text('STATUS CODE ${login.status.toString()}');
                  return result;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  signIn(String email, String password) async {
    print('password null ' + password.isEmpty.toString());

    LoginModel _creds;

    password.isEmpty
    ? _creds = LoginModel(email: email)
    : _creds = LoginModel(email: email, password: password);

    // Map _creds;
    // password.isEmpty
    // ? _creds = {"email": email}
    // : _creds = {"email": email, "password" : password};
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: _creds.toMap());
        print(response.statusCode);
        print(_creds);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        result = response.body;
      });
    } else {
      setState(() {
        result = response.body;
      });
      print('error ${response.body}');
    }
  }
}
