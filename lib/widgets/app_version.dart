import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Version 1.5.1 beta',
        ),
        Divider(
          height: 5,
          color: Colors.transparent,
        ),
        Text(
          '© Copyright 2021 AdvancePro Technologies',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
