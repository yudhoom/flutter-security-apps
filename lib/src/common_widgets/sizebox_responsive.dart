import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeBoxResponsive extends StatelessWidget {
  final Size mediaQuery;
  const SizeBoxResponsive({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuery.width > 360 ? 20.h : 15.h,
    );
  }
}
