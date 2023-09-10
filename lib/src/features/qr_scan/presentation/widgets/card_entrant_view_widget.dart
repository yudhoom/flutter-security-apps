import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading5.dart';
import '../../../../common_widgets/text_heading6.dart';
import '../../../home/presentation/widgets/getein_geteout_widget.dart';

class CardEntrantViewWidget extends HookConsumerWidget {
  final String empid;
  final String name;
  final String gender;
  final String companyInfo;
  final String? avatar;
  final bool? isStay;
  final bool isVisit;
  final String isStayDesc;
  final String? gateInGateOut;

  final Function onTapFunction;
  const CardEntrantViewWidget({
    Key? key,
    required this.empid,
    required this.name,
    required this.gender,
    required this.companyInfo,
    this.avatar,
    required this.onTapFunction,
    this.isStay,
    required this.isVisit,
    required this.isStayDesc,
    this.gateInGateOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btnGate = ref.watch(btnGateProvider);
    return Card(
      color: AppThemeJtlc.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.sp), side: BorderSide(color: AppThemeJtlc.jtlcGray, width: 1.0.sp)),
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
                      backgroundImage: btnGate == "gate_in"
                          ? Image.asset('assets/icons/gate_in.png').image
                          : Image.asset('assets/icons/gate_out.png').image,
                      backgroundColor: AppThemeJtlc.jtlcGray,
                      radius: 25.0.sp)),
              const Spacer(flex: 1),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHeading5(title: empid.substring(0, 2) == "DR" ? "-" : empid),
                    TextHeading5(title: name),
                    TextHeading6(
                        title: empid.substring(0, 2) == "DR" ? "Driver" : companyInfo, color: AppThemeJtlc.jtlcGrayMute),
                    TextHeading6(title: gender, color: AppThemeJtlc.jtlcGrayMute),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
