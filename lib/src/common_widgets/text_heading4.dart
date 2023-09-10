import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_config/app_theme_jtlc.dart';

class TextHeading4 extends ConsumerWidget {
  final String? title;
  final bool? isBold;
  final bool? isCenter;
  final Color? color;
  final int maxLines;
  final bool? mute;
  const TextHeading4({
    Key? key,
    this.color = Colors.black,
    this.title,
    this.isCenter = false,
    this.isBold,
    this.maxLines = 99,
    this.mute = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title ?? 'Text Heading',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: isCenter == true ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: isBold != null ? FontWeight.w600 : FontWeight.normal,
        // ignore: prefer_if_null_operators
        color: (color != null
            ? color
            : mute ?? true
                ? AppThemeJtlc.jtlcMute
                : Colors.black),
        // height: 1.3,
      ),
    );
  }
}
