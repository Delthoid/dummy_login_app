import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/widgets/login_form.dart';
import 'package:dummy_login_app/widgets/login_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        var _content;
        if (app.runningOnWeb == true) {
          if (MediaQuery.of(context).size.width > 600) {
            _content = const LoginWeb();
          } else {
            _content = const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: LoginForm(),
            );
          }
        } else {
          _content = const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: LoginForm(),
          );
        }
        return _content;
      },
    );
  }
}
