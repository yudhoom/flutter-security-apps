import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading5 extends ConsumerWidget {
  final String? title;
  final bool centerTitle;
  final Color? color;
  final int? maxLines;
  final bool? isBold;
  final bool? mute;
  const TextHeading5({
    Key? key,
    this.centerTitle = false,
    this.maxLines = 99,
    this.title,
    this.color,
    this.isBold,
    this.mute = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading 5',
      maxLines: maxLines,
      textAlign: centerTitle ? TextAlign.center : TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0.sp,
        color: (color ?? (mute ?? true ? AppThemeJtlc.jtlcMute : Colors.black)),
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
