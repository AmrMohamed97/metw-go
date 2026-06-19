import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(100),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: body,
    );

    return SliverFillRemaining(hasScrollBody: false, child: content);
  }
}
