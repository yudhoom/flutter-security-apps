import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OkButton extends StatelessWidget {
  final String? label;
  final bool? isText;
  final String? routeName;
  final String? routeNamePushRemoved;
  final bool? pushToLogin;
  final String? userRole;
  final VoidCallback? someFunction;
  final BuildContext? dialogContext;
  const OkButton({
    Key? key,
    this.label,
    this.isText,
    this.routeName,
    this.pushToLogin,
    this.userRole,
    this.routeNamePushRemoved,
    this.someFunction,
    this.dialogContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label ?? 'OK',
              // style: Theme.of(context).textTheme.button,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 11.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              if (someFunction != null) {
                if (dialogContext != null) {
                  Navigator.pop(dialogContext!);
                }
                someFunction?.call();
              } else {
                Navigator.pop(context);
              }
            },
          )
        : TextButton(
            child: Text(
              label ?? 'OK',
              // style:
              //     isText != null && isText == true ? Theme.of(context).textTheme.button : Theme.of(context).textTheme.button,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 11.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              if (someFunction != null) {
                if (dialogContext != null) {
                  Navigator.pop(dialogContext!);
                }
                someFunction?.call();
              } else {
                Navigator.pop(context);
              }
            },
          );
  }
}
