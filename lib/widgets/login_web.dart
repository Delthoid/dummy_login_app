import 'package:dummy_login_app/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    //if(screenWidth > 600){}

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 7),
      child: Row(
        children: [
          const Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: LoginForm(),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Flexible(
            child: Container(
              child: Image.asset(
                'assets/store.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
