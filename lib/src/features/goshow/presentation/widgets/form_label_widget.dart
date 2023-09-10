import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/text_heading5.dart';

class FormLabelWidget extends HookConsumerWidget {
  final String label;
  final IconData? paramIcon;
  final Color? paramColor;
  final Color? colorLabel;
  const FormLabelWidget({
    Key? key,
    required this.label,
    this.paramIcon,
    this.paramColor,
    this.colorLabel = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      children: [
        Icon(
          getIcon(),
          size: 16.0.sp,
          color: paramColor,
        ),
        SizedBox(width: 10.0.sp),
        TextHeading5(
          title: label,
          color: colorLabel,
        ),
      ],
    );
  }

  IconData? getIcon() {
    IconData icon = FeatherIcons.file;
    if (label.toLowerCase().contains('tanggal')) {
      icon = FeatherIcons.calendar;
    } else if (label.toLowerCase().contains('lokasi')) {
      icon = FeatherIcons.mapPin;
    } else {
      icon = paramIcon ?? FeatherIcons.file;
    }
    return icon;
  }
}
