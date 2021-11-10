import 'dart:ui';

import 'package:dummy_login_app/providers/app_provider.dart';
import 'package:dummy_login_app/providers/login_provider.dart';
import 'package:dummy_login_app/providers/profile_provider.dart';

import 'package:dummy_login_app/screens/home.dart';
import 'package:dummy_login_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      ChangeNotifierProvider<ProfileProvider>(
        create: (_) => ProfileProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
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
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Dummy Login',
          theme: ThemeData(
            //primarySwatch: Colors.purple,
            primaryColor: const Color(0XFF7F69FC),
            //fontFamily: GoogleFonts.poppinsTextTheme(),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          initialRoute: '/',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/': (context) => const LoginScreen(),
          },
        );
      },
    );
  }
}
