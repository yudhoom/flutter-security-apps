// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_config/palette.dart';
import '../../../../common_widgets/text_heading5.dart';
import '../../../../core/domain/user_shared_preferences.dart';
import '../../domain/model/bulk_gate.dart';
import '../../domain/model/qr_event.dart';
import '../../domain/model/visitor_gate.dart';
import '../check_in_screen.dart';
import '../scan_qr_controller.dart';
import '../security_camera_screen.dart';

enum SingingCharacter { tamu, karyawan }

enum Gender { pria, wanita }

class FormDriverWidget extends ConsumerStatefulWidget {
  final bool? isTemporary;
  final BuildContext? contextDialog;
  final MobileScannerController cameraController;
  const FormDriverWidget({
    Key? key,
    this.contextDialog,
    required this.cameraController,
    this.isTemporary = false,
  }) : super(key: key);

  @override
  FormDriverWidgetState createState() => FormDriverWidgetState();
}

class FormDriverWidgetState extends ConsumerState<FormDriverWidget> {
  Gender? _gender = Gender.pria;
  final _driverNameController = TextEditingController();
  //padding
  var defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.sp);
  var defaultTitlePadding = EdgeInsets.symmetric(horizontal: 25.0.sp, vertical: 10);
  var defaultVerticalPadding = EdgeInsets.symmetric(vertical: 10.0.sp);
  var paddingHorizontalTf = 25.0.sp;
  var paddingVerticalTf = 15.0.sp;
  // @override
  // void initState() {
  //   super.initState();
  //   //reset when first time form open;
  //   ref.read(contactPhoneProvider).clear();
  //   ref.read(contactNameProvider).clear();
  // }

  @override
  Widget build(BuildContext context) {
    final List<QrEvent?> visitor = ref.watch(visitorProvider);

    ref.listen<BulkGate>(visitorBulkControllerProvider, (previous, next) {
      if (next != null) {
        widget.cameraController.dispose();
        Navigator.pop(context);
        context.goNamed(SecurityCameraScreen.routeName);
      }
    });

    ref.listen<AsyncValue<VisitorGate?>>(
      bulkGateControllerProvider,
      (previous, next) {
        if (!next.isLoading && !next.hasError) {
          widget.cameraController.dispose();
          Navigator.pop(context);
          context.pushNamed(CheckInScreen.routeName);
        }
        if (!next.isRefreshing && next.hasError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Peringatan'),
                    content: Text('Error Gate In. ${next.error}'),
                  ));
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0.sp),
          ),
        ),
        foregroundColor: AppThemeJtlc.jtlcTitleBlack,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Driver'),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: AppThemeJtlc.jtlcBlueDark,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 130.0.sp,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppThemeJtlc.jtlcBlueDark,
                    width: 1.0.sp,
                  ),
                  foregroundColor: AppThemeJtlc.jtlcBlueDark,
                ),
                onPressed: () {
                  _doSaveParticipant(visitor);
                },
                child: const Text('Lewatkan'),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 130.0.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemeJtlc.jtlcBlueDark,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
                  textStyle: TextStyle(color: Palette.jpopsDarkPrimary.shade100),
                ),
                onPressed: () {
                  _doSaveDriverParticipant(visitor);
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ],
      body: KeyboardDismisser(
        gestures: const [
          GestureType.onTap,
          GestureType.onPanUpdateDownDirection,
        ],
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(10.0.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0.sp),
                Padding(
                  padding: defaultTitlePadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(FeatherIcons.file, size: 18.0, color: AppThemeJtlc.jtlcOrange),
                      SizedBox(width: 10.0.sp),
                      const TextHeading5(title: 'Nama Driver'),
                    ],
                  ),
                ),
                Container(
                  padding: defaultHorizontalPadding,
                  child: TextField(
                    // controller: _empNameController,
                    controller: _driverNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0.sp),
                      ),
                      labelText: 'Masukkan Nama Driver',
                    ),
                  ),
                ),
                SizedBox(height: 10.0.sp),
                Padding(
                  padding: defaultTitlePadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(FeatherIcons.user, size: 18.0, color: AppThemeJtlc.jtlcOrange),
                      SizedBox(width: 10.0.sp),
                      const TextHeading5(title: 'Gender'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Radio<Gender>(
                            value: Gender.pria,
                            groupValue: _gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                _gender = value;
                              });
                            }),
                        const Text('Laki-Laki'),
                      ]),
                      Row(children: [
                        Radio<Gender>(
                          value: Gender.wanita,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text('Perempuan'),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _doSaveParticipant(List<QrEvent?> visitor) async {
    //do something
    List<Visitors> visitorData = [];
    final username = await UserSharedPreferences.getUsername();
    for (var k in visitor) {
      if (k != null) {
        visitorData.add(Visitors(username: k.username));
      }
    }
    var bulkGate = BulkGate(
        // actionType: 'gate_in',
        securityUsername: username,
        driverName: null,
        driverGender: null,
        driverPhoto: null,
        visitors: visitorData);

    ref.read(bulkGateControllerProvider.notifier).bulkGate(bulkGate);
  }

  void _doSaveDriverParticipant(List<QrEvent?> visitor) async {
    List<Visitors> visitorData = [];
    final username = await UserSharedPreferences.getUsername();
    for (var k in visitor) {
      if (k != null) {
        visitorData.add(Visitors(username: k.username));
      }
    }

    var bulkGate = BulkGate(
        securityUsername: username,
        driverName: _driverNameController.text,
        driverGender: _gender == Gender.pria ? 1 : 2,
        driverPhoto: null,
        visitors: visitorData);

    ref.read(visitorBulkControllerProvider.notifier).add(bulkGate);
  }
}
