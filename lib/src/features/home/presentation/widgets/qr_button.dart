import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_config/palette.dart';
import '../../../qr_scan/presentation/scan_qr_screen_new.dart';

class QrButton extends StatelessWidget {
  const QrButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Palette.jpopsPrimary.shade400,
              width: 3.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.w,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: IconButton(
            iconSize: ScreenUtil().setWidth(100),
            color: Palette.jpopsPrimary,
            icon: const Icon(FontAwesomeIcons.qrcode),
            onPressed: () {
              // context.goNamed(ScanQRScreen.routeName);
              context.pushNamed(ScanQrScreenNew.routeName);
            },
          ),
        ),
        SizedBox(height: 10.h),
        const Text('Scan Ulang QR Code'),
        TextButton(
          onPressed: () {
            // context.pushNamed(ResultsScreen.routeName);
          },
          child: const Text('List Scanned'),
        ),
      ],
    );
  }
}
