import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';
import '../core/domain/entities/enum_gatein_gateout.dart';
import 'text_heading5.dart';
import 'text_heading6.dart';

class CardEntrantViewWidget extends HookConsumerWidget {
  final String empid;
  final String name;
  final String gender;
  final String tipePengunjung;
  final String? avatar;
  final String isOts;
  final String isExpired;
  final String isStayDesc;
  final int? gateInGateOut;

  final Function onTapFunction;
  const CardEntrantViewWidget({
    Key? key,
    required this.empid,
    required this.name,
    required this.gender,
    required this.tipePengunjung,
    this.avatar,
    required this.onTapFunction,
    required this.isOts,
    required this.isExpired,
    required this.isStayDesc,
    this.gateInGateOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: AppThemeJtlc.jtlcGrayLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.sp)),
      elevation: 0.0,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.all(14.0.sp),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  flex: 0,
                  child: CircleAvatar(
                      backgroundImage: gateInGateOut == EnumGateInGateOut.GateIn.index
                          ? Image.asset('assets/icons/gate_in.png').image
                          : gateInGateOut == EnumGateInGateOut.GateOut.index
                              ? Image.asset('assets/icons/gate_out.png').image
                              : null,
                      backgroundColor: AppThemeJtlc.jtlcGray,
                      radius: 25.0.sp)),
              const Spacer(flex: 1),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHeading5(title: empid),
                    TextHeading5(title: name),
                    TextHeading6(title: tipePengunjung, color: AppThemeJtlc.jtlcGrayMute),
                    TextHeading6(title: gender, color: AppThemeJtlc.jtlcGrayMute),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            width: 75.sp,
            margin: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 5.0.sp),
            // padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isOts == 'Y')
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.sp),
                      child: Image.asset('assets/icons/on_the_spot.png', width: 20.0.sp)),
                if (isExpired == 'Y')
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.sp),
                      child: Image.asset('assets/icons/expired.png', width: 20.0.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
