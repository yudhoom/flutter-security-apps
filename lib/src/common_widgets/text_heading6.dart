// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading6 extends ConsumerWidget {
  final String? title;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  final int? maxLines;
  final bool? mute;

  const TextHeading6({
    Key? key,
    this.isCenter,
    this.title,
    this.color,
    this.isBold,
    this.maxLines = 99,
    this.mute = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading 6',
      maxLines: maxLines,
      textAlign: isCenter != null ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontSize: 12.0.sp,
        color: (color != null
            ? color
            : mute ?? true
                ? AppThemeJtlc.jtlcMute
                : Colors.black),
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
