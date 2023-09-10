import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/common_config/app_theme_jtlc.dart';
import 'package:jtlc_front/src/features/goshow/presentation/form_tamu_hari_ini_screen.dart';
import 'package:jtlc_front/src/features/goshow/presentation/search_emp_manual_screen.dart';

import '../../../daftar_pengunjung/presentation/security_ots_camera_screen.dart';

class KaryawanTamuButtonWidget extends HookConsumerWidget {
  const KaryawanTamuButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.sp),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(FeatherIcons.userPlus),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppThemeJtlc.jtlcOrange,
                side: const BorderSide(color: AppThemeJtlc.jtlcOrange),
                padding: EdgeInsets.symmetric(vertical: 7.5.sp),
              ),
              onPressed: () {
                context.pushNamed(SearchEmpManualScreen.routeName);
              },
              label: const Text('Karyawan'),
            ),
          ),
          SizedBox(width: 10.0.sp),
          Expanded(
            child: OutlinedButton.icon(
                icon: const Icon(FeatherIcons.userPlus),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  side: const BorderSide(color: Colors.teal),
                  padding: EdgeInsets.symmetric(vertical: 7.5.sp),
                ),
                onPressed: () {
                  // context.pushNamed(FormTamuHariIniScreen.routeName);
                  context.goNamed(
                    SecurityOtsCameraScreen.routeName,
                    extra: FormTamuHariIniScreen.routeName,
                  );
                },
                label: const Text('Tamu')),
          ),
        ],
      ),
    );
  }
}
