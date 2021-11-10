import 'dart:convert';
import 'dart:math';

import 'package:dummy_login_app/models/login_model.dart';
import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:dummy_login_app/screens/home.dart';
import 'package:dummy_login_app/widgets/login_widget.dart';
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
  late LoginProvider prov;
  late AppProvider appProvider;

  Future<void> _submitLogin(String email, String password) async {
    prov.login(email: email, password: password, context: context);
  }

  @override
  void initState() {
    prov = Provider.of<LoginProvider>(context, listen: false);
    appProvider = Provider.of<AppProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('asd'),
      ),
      body: Container(
        child: const LoginWidget(),
      ),
    );
  }
}

//eve.holt@reqres.in