import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading1 extends ConsumerWidget {
  final String? title;
  final bool? isBold;
  final Color? color;
  final int? maxLines;
  final bool? mute;
  final double? fontSize;
  const TextHeading1({
    Key? key,
    this.title,
    this.isBold,
    this.color,
    this.maxLines = 99,
    this.mute = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading 1',
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? 23.0.sp,
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
        color: (color ?? (mute ?? true ? AppThemeJtlc.jtlcTitleBlack : Colors.black)),
      ),
      textAlign: TextAlign.left,
    );
  }
}
