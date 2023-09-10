// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading3 extends ConsumerWidget {
  final String? title;
  final bool? isBold;
  final Color color;
  final int? maxLines;
  final bool? mute;
  const TextHeading3({
    Key? key,
    this.color = Colors.black,
    this.title,
    this.isBold,
    this.maxLines = 99,
    this.mute = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading 3',
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
        color: (color != null
            ? color
            : mute ?? true
                ? AppThemeJtlc.jtlcMute
                : Colors.black),
      ),
    );
  }
}
