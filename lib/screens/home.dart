import 'package:dummy_login_app/models/model.dart';
import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        Widget _scaffold;
        if (app.runningOnWeb) {
          _scaffold = Scaffold(
            appBar: AppBar(
              title: const Text('API Practice'),
            ),
            body: Container(
              child: const MobileContent(),
            ),
          );
        } else {
          _scaffold = Scaffold(
            body: Stack(
              children: [
                Container(
                  color: Colors.red,
                  child: Container(
                    child: const MobileContent(),
                  ),
                ),
              ],
            ),
          );
        }
        return _scaffold;
      },
    );
  }
}

class MobileContent extends StatelessWidget {
  const MobileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/avatar.png',
                width: 50,
              ),
              const Expanded(child: Center())
            ],
          ),
        ],
      ),
    );
  }
}
