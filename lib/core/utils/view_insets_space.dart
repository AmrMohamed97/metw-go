import 'package:flutter/material.dart';

class ViewInsetsSpace extends StatelessWidget {
  const ViewInsetsSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: MediaQuery.of(context).viewInsets.bottom,
    );
  }
}
