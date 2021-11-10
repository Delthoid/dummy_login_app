import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:dummy_login_app/providers/provider.dart';
import 'package:dummy_login_app/screens/home.dart';
import 'package:dummy_login_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider<AppProvider>(
        create: (_) => AppProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.checkIfWeb(kIsWeb);
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/': (context) => const LoginScreen(),
          },
        );
      },
    );
    // return MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       initialRoute: '/login',
    //       routes: {
    //         '/': (context) => const HomeScreen(),
    //         '/login': (context) => const LoginScreen(),
    //       },
    //     );
  }
}
