import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading5.dart';
import '../../../../common_widgets/text_heading6.dart';

class CardEmployeeWidget extends HookConsumerWidget {
  final bool isOrganizer;
  final String empid;
  final String name;
  final String gender;
  final String companyInfo;
  final String avatar;

  final Function onTapFunction;
  const CardEmployeeWidget({
    Key? key,
    required this.isOrganizer,
    required this.empid,
    required this.name,
    required this.gender,
    required this.companyInfo,
    required this.avatar,
    required this.onTapFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: AppThemeJtlc.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.sp),
        side: BorderSide(color: Colors.grey, width: .5.sp),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(14.0.sp),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 0,
            child: CircleAvatar(
              radius: 32.0.sp,
              backgroundColor: AppThemeJtlc.jtlcGray,
              backgroundImage: CachedNetworkImageProvider(
                avatar,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeading5(title: empid),
                TextHeading5(title: name),
                TextHeading6(title: companyInfo, color: AppThemeJtlc.jtlcGrayMute),
                TextHeading6(title: gender, color: AppThemeJtlc.jtlcGrayMute),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
