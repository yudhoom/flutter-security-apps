import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/common_widgets/text_heading6.dart';

import '../../../../common_config/app_theme_jtlc.dart';

class CardAccessItemWidget extends ConsumerWidget {
  final String title;
  final String image;
  final int total;
  final Color? color;
  final Function()? onTap;
  const CardAccessItemWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.total,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Card(
        color: color ?? AppThemeJtlc.jtlcGray,
        child: ListTile(
          leading: Image.asset(image, width: 30.0.sp, height: 30.0.sp),
          title: TextHeading6(title: title),
          trailing: FittedBox(
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextHeading6(title: total.toString(), color: AppThemeJtlc.jtlcBlueDark),
              ),
              const Icon(FeatherIcons.arrowRightCircle, color: AppThemeJtlc.jtlcOrange)
            ]),
          ),
        ),
      ),
    );
  }
}
