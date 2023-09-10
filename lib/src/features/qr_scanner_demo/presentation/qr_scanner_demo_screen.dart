// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../common_widgets/text_heading6.dart';

class QRScannerDemoScreen extends StatefulWidget {
  const QRScannerDemoScreen({Key? key}) : super(key: key);
  static const String routeName = 'qrScannerDemoScreen';

  @override
  State<QRScannerDemoScreen> createState() => _QRScannerDemoScreenState();
}

class _QRScannerDemoScreenState extends State<QRScannerDemoScreen> {
  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 400.0,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: [
                    MobileScanner(
                        allowDuplicates: false,
                        controller: cameraController,
                        onDetect: (barcode, args) {
                          if (barcode.rawValue == null) {
                            debugPrint('Failed to scan Barcode');
                          } else {
                            final code = barcode.rawValue!;
                            setState(() {});
                            // _doSetResults(code);
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/qr-overlay.png', fit: BoxFit.fitHeight),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(FeatherIcons.users, color: AppThemeJtlc.jtlcOrange),
                        SizedBox(width: 5.0.sp),
                        const TextHeading5(title: 'Pengunjung'),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(7.5.sp),
                          decoration: const BoxDecoration(
                            color: AppThemeJtlc.jtlcBlueDark,
                            shape: BoxShape.circle,
                          ),
                          child: const TextHeading6(title: '0', color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
