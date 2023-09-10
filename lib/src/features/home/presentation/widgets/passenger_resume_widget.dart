import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading7.dart';

class PassengerResumeWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final int total;
  final Color? totalColor;
  final Color? backgroundColor;
  const PassengerResumeWidget({
    Key? key,
    required this.title,
    this.titleColor,
    required this.total,
    this.totalColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0.h,
      width: MediaQuery.of(context).size.width / 6.15.sp,
      padding: EdgeInsets.symmetric(horizontal: 6.5.sp, vertical: 7.5.sp),
      margin: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 3.0.sp),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppThemeJtlc.jtlcTanLight,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.5.sp),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        // TextHeading1(
        //   title: total.toString(),
        //   color: totalColor ?? AppThemeJtlc.jtlcOrange,
        //   fontSize: 20.0.sp,
        //   isBold: true,
        // ),
        AnimatedFlipCounter(
          duration: const Duration(milliseconds: 500),
          value: total,
          fractionDigits: 0, // decimal precision
          textStyle: TextStyle(
            fontSize: 20.0.sp,
            color: totalColor ?? AppThemeJtlc.jtlcOrange,
            fontWeight: FontWeight.bold,
            // color: total >= 0 ? Colors.green : Colors.red,
          ),
        ),
        TextHeading7(
          title: title,
          maxLines: 1,
          fontSize: 9.0.sp,
          color: titleColor ?? AppThemeJtlc.jtlcHeadingBlack,
          isCenter: true,
        ),
      ]),
    );
  }
}
