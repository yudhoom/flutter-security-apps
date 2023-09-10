import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final String? label;
  final bool? isText;
  final BuildContext? dialogContext;
  const CancelButton({Key? key, this.label, this.isText, this.dialogContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label ?? 'Tidak',
              style: Theme.of(context).textTheme.caption,
            ),
            onPressed: () {
              Navigator.pop(dialogContext!);
            },
          )
        : TextButton(
            child: Text(
              label ?? 'Tidak',
              style: Theme.of(context).textTheme.caption,
            ),
            onPressed: () {
              Navigator.pop(dialogContext!);
            },
          );
  }
}
