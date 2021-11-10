import 'package:dummy_login_app/providers/app_version.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginProvider prov;
  Future<void> _submitLogin(String email, String password) async {
    prov.login(email: email, password: password, context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    prov = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            Image.asset('assets/logo.png'),
            const Divider(
              color: Colors.transparent,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Divider(
              color: Colors.transparent,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Consumer<LoginProvider>(
              builder: (context, login, child) {
                Widget content;
                if (login.isLoading) {
                  content = const CircularProgressIndicator();
                } else {
                  content = ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45),
                    ),
                    onPressed: () async {
                      await _submitLogin(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: const Text('Log In'),
                  );
                }
                return content;
              },
            ),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text('Forgot password')),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                Text("Don't have account? "),
                Text("Create Here"),
              ],
            ),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            const AppVersion(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
