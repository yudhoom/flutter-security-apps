import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading5.dart';

class DetailItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? isOts;
  final String? isExpired;
  const DetailItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.isOts,
    this.isExpired,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 5.0.sp),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    TextHeading5(title: title, color: AppThemeJtlc.jtlcGrayMute),
                    SizedBox(height: 5.0.sp),
                    Row(
                      children: [
                        if (isOts == 'Y')
                          Padding(
                              padding: EdgeInsets.only(right: 10.5.sp),
                              child: Image.asset('assets/icons/on_the_spot.png', width: 20.0.sp)),
                        if (isExpired == 'Y')
                          Padding(
                              padding: EdgeInsets.only(right: 10.5.sp),
                              child: Image.asset('assets/icons/expired.png', width: 20.0.sp)),
                        TextHeading5(title: value),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(color: AppThemeJtlc.jtlcGray, thickness: 2.0.sp),
      ],
    );
  }
}
