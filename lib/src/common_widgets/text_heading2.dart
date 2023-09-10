// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading2 extends ConsumerWidget {
  final String title;
  final bool? isBold;
  final int? maxLines;
  final Color? color;
  final bool? compact;
  final bool? mute;
  final double? fontSize;
  const TextHeading2({
    Key? key,
    required this.title,
    this.maxLines = 99,
    this.isBold,
    this.color,
    this.compact,
    this.mute = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: compact == true ? .75.sp : 1.0.sp,
        fontSize: fontSize ?? 20.0.sp,
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
        color: (color != null
            ? color
            : mute ?? true
                ? AppThemeJtlc.jtlcTitleBlack
                : Colors.black),
        letterSpacing: compact == true ? -0.5.sp : 0.0.sp,
      ),
      textAlign: TextAlign.left,
    );
  }
}
