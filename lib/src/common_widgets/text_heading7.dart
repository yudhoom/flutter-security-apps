// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading7 extends ConsumerWidget {
  final String? title;
  final Color? color;
  final bool? isBold;
  final int? maxLines;
  final bool? mute;
  final FontStyle? fontStyle;
  final double? fontSize;
  final bool? isCenter;

  const TextHeading7({
    Key? key,
    this.title,
    this.color,
    this.isBold,
    this.maxLines = 99,
    this.mute = false,
    this.fontStyle = FontStyle.normal,
    this.fontSize,
    this.isCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading 7',
      style: TextStyle(
        fontSize: fontSize ?? 11.0.sp,
        color: (color != null
            ? color
            : mute ?? true
                ? AppThemeJtlc.jtlcMute
                : Colors.black),
        fontWeight: isBold != null ? FontWeight.w400 : FontWeight.normal,
        fontStyle: fontStyle != null ? fontStyle : FontStyle.normal,
      ),
      textAlign: isCenter ?? true ? TextAlign.center : TextAlign.start,
    );
  }
}
