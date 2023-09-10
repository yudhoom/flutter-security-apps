import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/common_config/app_theme_jtlc.dart';
import 'package:jtlc_front/src/common_widgets/text_heading1.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/domain/enum_pengunjung.dart';

class HeaderWidget extends HookConsumerWidget {
  final EnumTypePengunjung type;
  final int totalCounter;
  const HeaderWidget({
    Key? key,
    required this.type,
    required this.totalCounter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1.sp,
          decoration: BoxDecoration(
            color: getColorByType(type),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 5)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/${getIconByType(type)}', width: 40.w),
            SizedBox(width: 10.0.sp),
            TextHeading1(
              title: totalCounter.toString(),
              fontSize: 36.0.sp,
              color: type == EnumTypePengunjung.vip ? Colors.white : Colors.black,
            ),
          ],
        )
      ],
    );
  }

  getColorByType(EnumTypePengunjung type) {
    switch (type) {
      case EnumTypePengunjung.hariIni:
        return AppThemeJtlc.jtlcBlue;
      case EnumTypePengunjung.vip:
        return AppThemeJtlc.jtlcBlackVip;
      case EnumTypePengunjung.regular:
        return AppThemeJtlc.orangeAccent;
      case EnumTypePengunjung.aktual:
        return AppThemeJtlc.tealAccent;
    }
  }

  getIconByType(EnumTypePengunjung type) {
    switch (type) {
      case EnumTypePengunjung.hariIni:
        return 'access_today.png';
      case EnumTypePengunjung.vip:
        return 'access_vip.png';
      case EnumTypePengunjung.regular:
        return 'access_regular.png';
      case EnumTypePengunjung.aktual:
        return 'access_actual.png';
    }
  }
}
