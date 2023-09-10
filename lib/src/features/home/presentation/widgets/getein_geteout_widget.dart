import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../qr_scan/presentation/scan_qr_screen_new.dart';

final btnGateProvider = StateProvider<String?>((ref) => null);

class GateinGateoutWidget extends HookConsumerWidget {
  const GateinGateoutWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<String?>(btnGateProvider, (previous, next) {
    //   if (next != null) {
    //     context.goNamed(ScanQrScreenNew.routeName);
    //   }
    // });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 10.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 35.0.sp,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                icon: const Icon(FeatherIcons.userCheck),
                onPressed: () {
                  ref.read(btnGateProvider.notifier).state = 'gate_in';
                  context.goNamed(ScanQrScreenNew.routeName);
                  // context.pushNamed(ScanQrScreenNew.routeName);
                },
                label: const Text('Gate-In'),
              ),
            ),
          ),
          SizedBox(width: 10.0.sp),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 35.0.sp,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
                icon: const Icon(FeatherIcons.userMinus),
                onPressed: () {
                  ref.read(btnGateProvider.notifier).state = 'gate_out';
                  context.goNamed(ScanQrScreenNew.routeName);
                },
                label: const Text('Gate-Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
