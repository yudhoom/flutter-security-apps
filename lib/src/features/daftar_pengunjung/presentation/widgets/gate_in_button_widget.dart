import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading6.dart';

class GateInButtonWidget extends StatelessWidget {
  final Function doSubmit;
  const GateInButtonWidget({
    super.key,
    required this.doSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppThemeJtlc.gateInButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 5.0.sp),
      ),
      icon: const Icon(FeatherIcons.userPlus),
      onPressed: () {
        doSubmit.call();
      },
      label: const TextHeading6(title: 'Gate In', color: AppThemeJtlc.white),
    );
  }
}
