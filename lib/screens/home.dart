import 'package:dummy_login_app/models/profile_model.dart';
import 'package:dummy_login_app/models/user_list_model.dart';
import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/profile_provider.dart';
import 'package:dummy_login_app/widgets/button.dart';
import 'package:dummy_login_app/widgets/mobile_content.dart';
import 'package:dummy_login_app/widgets/player.dart';
import 'package:dummy_login_app/widgets/web_content.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        Widget _scaffold;
        if (app.runningOnWeb) {
          if (MediaQuery.of(context).size.width < 1000) {
            //Same view as mobile
            _scaffold = _scaffold = Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: const MobileContent(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            _scaffold = Scaffold(
              body: Container(
                child: const SingleChildScrollView(child: WebContent()),
              ),
            );
          }
        } else {
          _scaffold = Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: const MobileContent(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return _scaffold;
      },
    );
  }
}
