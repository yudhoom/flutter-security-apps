import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';

class EventHeaderWidget extends HookConsumerWidget {
  final dynamic dataku;
  final String? statusTitle;
  const EventHeaderWidget({
    Key? key,
    required this.dataku,
    this.statusTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.10.sp,
        decoration: const BoxDecoration(
          color: AppThemeJtlc.blueSky,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/icons/pin_marker.png', width: 30.0.sp),
            Text(
              '${dataku['']}',
              style: TextStyle(
                fontSize: 5.0.sp,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
