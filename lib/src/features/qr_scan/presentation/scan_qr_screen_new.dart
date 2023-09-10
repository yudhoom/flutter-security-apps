import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading4.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../daftar_pengunjung/domain/enum_pengunjung.dart';
import '../../daftar_pengunjung/domain/pengunjung_param.dart';
import '../../home/presentation/home_screen.dart';
import '../../home/presentation/widgets/getein_geteout_widget.dart';
import '../data/model/qr_event_model.dart';
import '../domain/model/bulk_gate.dart';
import '../domain/model/qr_event.dart';
import '../domain/model/visitor_gate.dart';
import 'check_in_screen.dart';
import 'scan_qr_controller.dart';
import 'visitor_detail_screen.dart';
import 'widgets/form_driver_widget.dart';

final dataPengunjungTerscanProvider = StateProvider<List<String>>((ref) => []);
final qrEventResult = StateProvider((ref) => const QrEvent());

class ScanQrScreenNew extends StatefulHookConsumerWidget {
  const ScanQrScreenNew({Key? key}) : super(key: key);
  static const routeName = 'scan-qr-screen-new';

  @override
  ScanQrScreenNewState createState() => ScanQrScreenNewState();
}

class ScanQrScreenNewState extends ConsumerState<ScanQrScreenNew> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
    cameraController.start();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEnabled = true;
    final btnGate = ref.watch(btnGateProvider);
    final visitor = ref.watch(visitorProvider);

    ref.listen<AsyncValue<VisitorGate?>>(
      bulkGateOutControllerProvider,
      (previous, next) {
        if (!next.isLoading && !next.hasError) {
          cameraController.dispose();
          context.pushNamed(CheckInScreen.routeName);
        }
        if (!next.isRefreshing && next.hasError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text('Error menyimpan data. ${next.error}'),
                  ));
        }
      },
    );

    ref.listen<AsyncValue<QrEventModel?>>(
      scanQrControllerProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            Logger().wtf(next.value.toString());
            ref.read(visitorProvider.notifier).addParticipant(QrEvent(
                  username: next.value?.data?.username,
                  name: next.value?.data?.name,
                  company: next.value?.data?.company,
                  gender: next.value?.data?.gender,
                  photo: next.value?.data?.photo,
                  visitorCategory: next.value?.data?.visitorCategory,
                  idEvent: next.value?.data?.idEvent,
                  idManifest: next.value?.data?.idManifest,
                ));

            // Navigator.pop(context);
          }
        }

        if (!next.isRefreshing && next.hasError) {
          var errMsg = (next.error as GeneralFailure).message ?? '';
          Logger().wtf(next.error.toString());
          if ((next.error as GeneralFailure).code == 400) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errMsg),
              ),
            );
          }
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        // ref.read(visitorProvider.notifier).state.clear();
        // context.goNamed(HomeScreen.routeName);
        _doBackHome();
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: const Text('Scan QR'),
          // ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 400.0.sp,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      MobileScanner(
                          allowDuplicates: true,
                          controller: cameraController,
                          onDetect: (barcode, args) {
                            if (isEnabled) {
                              isEnabled = false;
                              Timer(const Duration(seconds: 3), () => isEnabled = true);
                              ref.read(scanQrControllerProvider.notifier).findEmployee(barcode.rawValue!, btnGate ?? '');
                            }
                          }
                          // onDetect: (barcode, args) {
                          //   if (barcode.rawValue == null) {
                          //     //dosomething
                          //   } else {
                          //     final String code = barcode.rawValue!;
                          //     // setState(() {});
                          //     ref.read(scanQrControllerProvider.notifier).findEmployee(code, btnGate ?? '');
                          //   }
                          // }
                          ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/qr-overlay.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.025.sp,
                        top: MediaQuery.of(context).size.height * 0.040.sp,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: InkWell(
                            onTap: () => _doBackHome(),
                            child: Icon(
                              FeatherIcons.arrowLeftCircle,
                              size: 28.0.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const WidgetSpan(
                          child: Icon(FeatherIcons.users, color: AppThemeJtlc.jtlcOrange),
                        ),
                        TextSpan(
                          text: '\t\rPengunjung',
                          style: TextStyle(
                            color: const Color(0xff153243),
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ])),
                      // const Icon(FeatherIcons.users, color: AppThemeJtlc.jtlcOrange),
                      // SizedBox(width: 5.0.sp),
                      // const TextHeading5(title: 'Pengunjung'),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(7.5.sp),
                        decoration: const BoxDecoration(
                          color: AppThemeJtlc.jtlcBlueDark,
                          shape: BoxShape.circle,
                        ),
                        child: TextHeading6(
                          title: visitor.length.toString(),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: visitor.length,
                  shrinkWrap: true,
                  itemBuilder: (datas, i) {
                    var e = visitor[(visitor.length - 1) - i];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          VisitorDetailScreen.routeName,
                          extra: PengunjungParam(
                            username: e?.username,
                            idEvent: e?.idEvent.toString(),
                            // idManifest: e?.idManifest.toString(),
                            idManifest: e?.idManifest.toString(),
                            visitorType: e?.visitorCategory == "vip"
                                ? EnumTypePengunjung.vip
                                : e?.visitorCategory == "regular"
                                    ? EnumTypePengunjung.regular
                                    : EnumTypePengunjung.hariIni,
                            routeName: '',
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.sp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Stack(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(e?.photo ?? ''),
                                  radius: 25.0.sp,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextHeading5(title: e?.username ?? ''),
                                    TextHeading4(title: e?.name ?? ''),
                                    TextHeading6(title: e?.company ?? '', color: AppThemeJtlc.jtlcGrayMute),
                                    TextHeading6(title: e?.gender ?? '', color: AppThemeJtlc.jtlcGrayMute),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: -10.0,
                                top: -10.0,
                                child: IconButton(
                                  onPressed: () {
                                    // setState(() {});
                                    // _doRemovedItem(e?.username ?? '');
                                    // visitor.remove(e);
                                    ref.read(visitorProvider.notifier).removeParticipant(QrEvent(
                                          username: e?.username,
                                          name: e?.name,
                                          company: e?.company,
                                          gender: e?.gender,
                                          photo: e?.photo,
                                          visitorCategory: e?.visitorCategory,
                                          idEvent: e?.idEvent,
                                          idManifest: e?.idManifest,
                                        ));
                                  },
                                  icon: const Icon(
                                    FeatherIcons.x,
                                    color: AppThemeJtlc.jtlcOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnGate == "gate_in" ? Colors.teal : Colors.red.shade300,
                  padding: EdgeInsets.all(10.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  // ref.read(dataPengunjungTerscanProvider.notifier).state = _scanValues;
                  // context.pushNamed(Home2Screen.routeName);
                  btnGate == "gate_in" ? _doGateIn(context, isNew: true) : _doGateOut(visitor);
                },
                icon: btnGate == "gate_in" ? const Icon(FeatherIcons.userCheck) : const Icon(FeatherIcons.userMinus),
                label: btnGate == "gate_in" ? const Text('Konfirmasi Gate In') : const Text('Konfirmasi Gate Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, bool paramIsNew) {
    return FractionallySizedBox(
        heightFactor: MediaQuery.of(context).viewInsets.bottom == 0 ? 0.5.sp : 0.7.sp,
        widthFactor: 1,
        child: FormDriverWidget(
          contextDialog: context,
          cameraController: cameraController,
        ));
  }

  Future<void> _doBackHome() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Anda yakin ingin membatalkan ?'),
        actions: [
          CancelButton(
            label: 'Tidak',
            dialogContext: dialogContext,
          ),
          OkButton(
            label: 'Ya',
            someFunction: () {
              ref.read(visitorProvider.notifier).resetParticipant();
              context.goNamed(HomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  void _doGateIn(BuildContext dialogContext, {bool isNew = false}) {
    showModalBottomSheet(
      elevation: 3.0.sp,
      isScrollControlled: true,
      context: dialogContext,
      builder: (context) => _buildBottomSheet(
        context,
        isNew,
      ),
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0.sp),
        ),
      ),
    );
  }

  void _doGateOut(List<QrEvent?> visitor) async {
    List<Visitors> visitorData = [];
    final username = await UserSharedPreferences.getUsername();

    for (var k in visitor) {
      if (k != null) {
        visitorData.add(Visitors(username: k.username));
      }
    }
    var bulkGate = BulkGate(
        // actionType: 'gate_in',
        // securityUsername: '10027206',
        securityUsername: username,
        driverName: null,
        driverGender: null,
        driverPhoto: null,
        visitors: visitorData);

    ref.read(bulkGateOutControllerProvider.notifier).bulkGateOut(bulkGate);
  }

  bool isValidQr(String item) {
    return true;
  }

  void showError(BuildContext context, Object? error) {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text('Peringatan'),
        content: const TextHeading6(title: 'Terjadi kesalahan, silahkan coba lagi atau hubungi administrator.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(contextDialog).pop();
            },
          ),
        ],
      ),
    );
  }
}
