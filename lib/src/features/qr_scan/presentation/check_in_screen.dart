// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/common_utils/ansyn_value_widget.dart';
import 'package:jtlc_front/src/common_widgets/text_heading1.dart';
import 'package:jtlc_front/src/common_widgets/text_heading3.dart';
import 'package:jtlc_front/src/common_widgets/text_heading4.dart';
import 'package:jtlc_front/src/common_widgets/text_heading6.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/model/visitor_gate.dart';
import 'package:jtlc_front/src/features/qr_scan/presentation/scan_qr_controller.dart';
import 'package:jtlc_front/src/features/qr_scan/presentation/scan_qr_screen_new.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../home/presentation/widgets/getein_geteout_widget.dart';
import 'widgets/card_entrant_view_widget.dart';

class CheckInScreen extends StatefulHookConsumerWidget {
  const CheckInScreen({super.key});
  static const routeName = 'checkInScreen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckInState();
}

class _CheckInState extends ConsumerState<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    final bulkGate = ref.watch(bulkGateControllerProvider); //untuk provider gate in
    final bulkGateOut = ref.watch(bulkGateOutControllerProvider); //untuk provider gate out
    final btnGate = ref.watch(btnGateProvider); //detect provider gate_in atau gate_out
    final scrollController = useTextEditingController();

    useListenable(scrollController);
    return WillPopScope(
      onWillPop: () async {
        ref.read(visitorProvider.notifier).resetParticipant();
        context.pushNamed(ScanQrScreenNew.routeName);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: btnGate == "gate_in" ? const Text('Konfirmasi Gate In') : const Text('Konfirmasi Gate Out'),
            leading: IconButton(
              icon: const Icon(FeatherIcons.arrowLeft),
              onPressed: () {
                ref.read(visitorProvider.notifier).resetParticipant();
                context.pushNamed(ScanQrScreenNew.routeName);
              },
            ),
          ),
          body: AsyncValueWidget<VisitorGate?>(
            value: btnGate == "gate_in" ? bulkGate : bulkGateOut,
            data: (datas) {
              debugPrint('datas: $datas');
              return Column(children: [
                Expanded(
                    flex: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: const Color(0xff3ab795).withOpacity(0.9420799612998962),
                              ),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Image.asset(
                                          'assets/icons/gate_in.png',
                                          width: 35.w,
                                        ),
                                      ),
                                      btnGate == "gate_in"
                                          ? const TextHeading5(title: "Gate In Berhasil")
                                          : const TextHeading5(title: "Konfirmasi Gate Out Berhasil"),
                                    ],
                                  )),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(40.sp),
                          decoration: const BoxDecoration(
                            color: AppThemeJtlc.jtlcBlueDark,
                            shape: BoxShape.circle,
                          ),
                          child: TextHeading1(
                            title: datas?.visitors?.length.toString(),
                            color: Colors.white,
                            fontSize: 50.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FeatherIcons.users, color: AppThemeJtlc.jtlcOrange),
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: TextHeading3(
                                title: "Pengunjung",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              btnGate == "gate_in" ? 'assets/icons/gate_in.png' : 'assets/icons/gate_out.png',
                              width: 30.0.sp,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextHeading4(
                                title: btnGate == "gate_in" ? "Gate In" : "Gate Out",
                                color: btnGate == "gate_in" ? AppThemeJtlc.gateInButton : AppThemeJtlc.gateOutButton,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: TextHeading6(
                                title: datas?.actionTime ?? '',
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 0.0.sp),
                    itemCount: datas?.visitors?.length ?? 0,
                    itemBuilder: ((context, index) {
                      final dataku = datas?.visitors?[index];
                      return CardEntrantViewWidget(
                        empid: dataku?.username?.toString() ?? '',
                        name: dataku?.name?.toString() ?? '',
                        gender: dataku?.gender?.toString() ?? '',
                        companyInfo: dataku?.company?.toString() ?? '',
                        onTapFunction: () {},
                        isVisit: false,
                        isStayDesc: '',
                      );
                    }),
                    separatorBuilder: ((context, index) => SizedBox(height: 7.5.sp)),
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
