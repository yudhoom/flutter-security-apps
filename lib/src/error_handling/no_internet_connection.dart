import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rive/rive.dart';

import '../common_widgets/text_heading5.dart';

class NoInternetConnection extends HookConsumerWidget {
  const NoInternetConnection({Key? key}) : super(key: key);
  static const String routeName = 'no_internet_connection';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.0.sp,
              width: 200.0.sp,
              child: const RiveAnimation.asset(
                'assets/icons/conn_states.riv',
                animations: ['Connecting'],
              ),
            ),
            const TextHeading5(
              title: 'Mohon cek koneksi internet Anda.',
            )
          ],
        ),
      ),
    );
  }
}
