import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.action,
    required this.child,
  }) : super(key: key);

  final Function() action;
  final Widget child;

  @override
  ElevatedButton build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(double.infinity, 50),
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
        elevation: 10,
      ),
      onPressed: action,
      child: child,
    );
  }
}
