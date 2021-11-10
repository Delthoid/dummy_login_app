import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class AppProvider extends ChangeNotifier {
  bool runningOnWeb = false;

  void checkIfWeb(bool isWeb) {
    runningOnWeb = isWeb;
  }
}
