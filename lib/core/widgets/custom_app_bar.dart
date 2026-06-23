import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.popPress,
    this.title,
    this.centerTitle,
    this.canPob = true,
  });
  final void Function()? popPress;
  final String? title;
  final bool? centerTitle;
  final bool canPob;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? null : Text(title!),
      centerTitle: centerTitle,
      automaticallyImplyLeading: canPob ,
      leading: canPob
          ? CupertinoButton(
              onPressed: popPress ?? () => context.pop(),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 16),
                clipBehavior: Clip.antiAlias,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.outline,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
