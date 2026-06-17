import 'package:flutter/material.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      body: Text('2'),
    );
  }
}