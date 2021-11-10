import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/widgets/app_version.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:dummy_login_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginProvider prov;
  late AppProvider appProv;

  Future<void> _submitLogin(String email, String password) async {
    prov.login(email: email, password: password, context: context);
  }

  void _saveEmail(BuildContext context, String email) {
    appProv.currentEmail = email;
    print(appProv.currentEmail);
  }

  @override
  void initState() {
    prov = Provider.of<LoginProvider>(context, listen: false);
    appProv = Provider.of<AppProvider>(context, listen: false);
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Email',
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
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
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
                  content = CustomButton(
                    child: const Text('Log In'),
                    action: () async {
                      if (_formKey.currentState!.validate()) {
                        await _submitLogin(
                          emailController.text,
                          passwordController.text,
                        );
                        _saveEmail(context, emailController.text);
                      }
                    },
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
