// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../daftar_pengunjung/presentation/pengunjung_hari_ini_screen.dart';
import '../../daftar_pengunjung/presentation/security_ots_camera_screen.dart';
import '../../daftar_pengunjung/presentation/widgets/gate_in_button_widget.dart';
import '../../qr_scan/presentation/widgets/form_label_widget.dart';
import '../../qr_scan/presentation/widgets/text_field_widget.dart';
import '../domain/entities/gate_in_input_karyawan.dart';
import '../domain/entities/gate_in_karyawan_tamu.dart';
import 'goshows_controller.dart';
import 'search_controller.dart';
import 'widgets/event_header_widget.dart';

enum Gender { pria, wanita }

class FormKaryawanHariIniScreen extends StatefulHookConsumerWidget {
  const FormKaryawanHariIniScreen({super.key});
  static const routeName = 'form-karyawan-hari-ini-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormKaryawanHariIniScreenState();
}

class _FormKaryawanHariIniScreenState extends ConsumerState<FormKaryawanHariIniScreen> {
  bool isLoadingGateIn = false;

  @override
  Widget build(BuildContext context) {
    final captureTmpImageProfileState = ref.watch(captureTmpImageProfile(EnumTypeTemporaryImg.karyawan.index));
    final entrantState = ref.watch(entrantControllerProvider)?.first;
    var defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.sp);
    var paddingHorizontalTf = 40.0.sp;
    var paddingVerticalTf = 0.0.sp;

    Logger().w(captureTmpImageProfileState);

    ref.listen<AsyncValue<GateInKaryawanTamu?>>(
      goshowsControllerProvider,
      (prev, state) {
        if ((!state.isRefreshing && !state.isLoading) && !state.hasError) {
          context.goNamed(
            PengunjungHariIniScreen.routeName,
            extra: state.value?.idEvent,
          );
          setState(() {
            isLoadingGateIn = false;
          });
        }
        if ((!state.isRefreshing && !state.isLoading) && state.hasError) {
          showError((state.error as GeneralFailure).message);
          setState(() {
            isLoadingGateIn = false;
          });
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        doBack();
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppThemeJtlc.white,
          appBar: AppBar(
            title: const Text('Form Tamu Hari Ini'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const EventHeaderWidget(dataku: {'title': 'Form Tamu Hari Ini'}),
              // Text('${captureTmpImageProfileState['imageLocation']}'),
              Expanded(
                flex: 1,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                      child: entrantState != null
                          ? SizedBox(
                              child: CircleAvatar(
                                radius: 125.0.sp,
                                backgroundColor: AppThemeJtlc.jtlcGrayMute,
                                backgroundImage: (entrantState.imageProfileUrl?.length as num) > 0
                                    ? Image.network(
                                        entrantState.imageProfileUrl ?? '',
                                        fit: BoxFit.cover,
                                      ).image
                                    : Image.network(
                                        captureTmpImageProfileState['imageProfileUrl'].toString(),
                                        fit: BoxFit.contain,
                                      ).image,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.sp, vertical: 25.0.sp),
                      decoration: BoxDecoration(
                        color: AppThemeJtlc.jtlcGrayLight,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.0.sp), topRight: Radius.circular(25.0.sp)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                            padding: defaultHorizontalPadding,
                            child: const FormLabelWidget(
                              colorLabel: AppThemeJtlc.jtlcGrayMute,
                              label: 'Nama Pengunjung',
                              paramIcon: FeatherIcons.user,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: TextFieldWidget(type: 'readonlyValue', initValue: entrantState?.name ?? ''),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                            padding: defaultHorizontalPadding,
                            child: const FormLabelWidget(
                              label: 'NIK',
                              colorLabel: AppThemeJtlc.jtlcGrayMute,
                              paramIcon: FeatherIcons.file,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: TextFieldWidget(type: 'readonlyValue', initValue: entrantState?.username ?? ''),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Perusahaan',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.briefcase,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: TextFieldWidget(initValue: entrantState?.persareaname ?? '', type: 'readonlyValue'),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Gender',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.user,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: TextFieldWidget(initValue: entrantState?.gendername ?? '', type: 'readonlyValue'),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Status',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.file,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: const TextFieldWidget(initValue: 'Karyawan', type: 'readonlyValue'),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Tipe Event',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.file,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 15.0.sp),
                                child: Image.asset('assets/icons/on_the_spot.png', width: 20.0.sp),
                              ),
                              const TextHeading5(
                                title: 'Kunjungan',
                              )
                            ],
                          ),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Gate In',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.arrowUpRight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: SizedBox(height: 20.0.sp),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                        Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Gate Out',
                            colorLabel: AppThemeJtlc.jtlcGrayMute,
                            paramIcon: FeatherIcons.arrowDownLeft,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                          child: SizedBox(height: 20.0.sp),
                        ),
                        Divider(color: AppThemeJtlc.jtlcGray, thickness: 1.0.sp),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            // Center(
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width * 0.6.sp,
            //     child: GateInButtonWidget(doSubmit: () async {
            //       final usernameSecurity = await UserSecureStorage.getUsername();
            //       var input = GateInInputKaryawan(
            //         visitor: Visitor(
            //           username: entrantState?.username,
            //           name: entrantState?.name,
            //           grade: entrantState?.grade,
            //           gendercode: entrantState?.gendercode,
            //           compcode: entrantState?.compcode,
            //           compcodename: entrantState?.compcodename,
            //           persareacode: entrantState?.persareacode,
            //           persareaname: entrantState?.persareaname,
            //           perssubareacode: entrantState?.perssubareacode,
            //           perssubareaname: entrantState?.perssubareaname,
            //           spvEmpid: entrantState?.spvEmpid,
            //           spvEmpname: entrantState?.spvEmpname,
            //           imageLocation: entrantState?.imageProfileUrl?.length == 0 ? 'null' : entrantState?.imageProfileUrl,
            //         ),
            //         username: usernameSecurity,
            //       );
            //       ref.read(goshowsControllerProvider.notifier).gateInOtsEmployee(input);
            //     }),
            //   ),
            // ),
            if (!isLoadingGateIn)
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6.sp,
                  // child: entrantState?.imageAvailable == false
                  child: entrantState?.imageAvailable == false && captureTmpImageProfileState['imageLocation'] == ''
                      ? ElevatedButton(
                          onPressed: () {
                            context.pushNamed(SecurityOtsCameraScreen.routeName, extra: FormKaryawanHariIniScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppThemeJtlc.jtlcBlueDark,
                            padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.sp)),
                          ),
                          child: const Text('Ambil Foto'),
                        )
                      : GateInButtonWidget(doSubmit: () async {
                          final username = await UserSharedPreferences.getUsername();
                          var input = GateInInputKaryawan(
                            visitor: Visitor(
                              username: entrantState?.username,
                              name: entrantState?.name,
                              grade: entrantState?.grade,
                              gendercode: entrantState?.gendercode,
                              compcode: entrantState?.compcode,
                              compcodename: entrantState?.compcodename,
                              persareacode: entrantState?.persareacode,
                              persareaname: entrantState?.persareaname,
                              perssubareacode: entrantState?.perssubareacode,
                              perssubareaname: entrantState?.perssubareaname,
                              spvEmpid: entrantState?.spvEmpid,
                              spvEmpname: entrantState?.spvEmpname,
                              imageLocation: (entrantState?.imageAvailable == true)
                                  ? null
                                  : captureTmpImageProfileState['imageLocation'],
                            ),
                            username: username,
                          );
                          ref.read(goshowsControllerProvider.notifier).gateInOtsEmployee(input);
                          setState(() {
                            isLoadingGateIn = true;
                          });
                        }),
                ),
              )
            else
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }

  void showError(String? message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Peringatan'),
              content: Text(message ?? ''),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  void doBack() {
    doResetImage();
    Navigator.pop(context);
    // ref.read(captureTmpImageProfile(EnumTypeTemporaryImg.karyawan.index).notifier).state = {};
  }

  void doResetImage() {
    ref.read(captureTmpImageProfile(EnumTypeTemporaryImg.karyawan.index).notifier).state = {
      'imageLocation': '',
      'imageProfileUrl': '',
      'type': EnumTypeTemporaryImg.karyawan.index
    };
  }
}

enum EnumTypeTemporaryImg { karyawan, tamu }
