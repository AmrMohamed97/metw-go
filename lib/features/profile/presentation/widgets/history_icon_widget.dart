import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/router/app_routes.dart';

class HistoryIconWidget extends StatelessWidget {
  const HistoryIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minimumSize: Size.zero,
      padding: EdgeInsets.all(0),
      onPressed: () => context.push(AppRoutes.historyPage),
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 12),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(
          Icons.history,
          color: Theme.of(context).colorScheme.surface,
          size: 20,
        ),
      ),
    );
  }
}
