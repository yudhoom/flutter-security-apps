// ignore_for_file: unused_result

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/core/client/failure.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_hari_ini_controller.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/ansyn_value_widget.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../core/domain/entities/enum_gatein_gateout.dart';
import '../../home/domain/entity/visitor_detail.dart';
import '../../home/domain/entity/visitor_gate_in_out.dart';
import '../../home/domain/entity/visitor_input.dart';
import '../domain/enum_pengunjung.dart';
import '../domain/pengunjung_param.dart';
import 'pengunjung_aktual_screen.dart';
import 'pengunjung_hari_ini_screen.dart';
import 'pengunjung_regular_screen.dart';
import 'pengunjung_vip_screen.dart';
import 'visitor_controller.dart';
import 'visitor_detail_controller.dart';
import 'widgets/detail_item_widget.dart';

enum EnumEmployeeType { nonEmployee, employee }

class PengunjungDetailScreen extends StatefulHookConsumerWidget {
  final PengunjungParam pengunjungParam;
  const PengunjungDetailScreen({super.key, required this.pengunjungParam});
  static const routeName = 'pengunjung-detail-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PengunjungDetailScreenState();
}

class _PengunjungDetailScreenState extends ConsumerState<PengunjungDetailScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<VisitorGateInOut?>>(
      visitorPutGateOutControllerProvider,
      (prev, state) {
        if (state is AsyncValue && state is! AsyncError) {
          if (state.value != null) {
            if (state is AsyncData && (AsyncData(state.value).hasValue)) {
              doRefresh();
              context.goNamed(widget.pengunjungParam.routeName ?? '');
            }
          }
        }
        if (state is AsyncError && !state.isRefreshing) {
          showError(state);
        }
      },
    );
    ref.listen<AsyncValue<VisitorGateInOut?>>(
      visitorPostGateInControllerProvider,
      (prev, state) {
        if (state is AsyncValue && state is! AsyncError) {
          if (state.value != null) {
            if (state is AsyncData && (AsyncData(state.value).hasValue)) {
              doRefresh();
              context.goNamed(widget.pengunjungParam.routeName ?? '');
            }
          }
        }
        if (state is AsyncError && !state.isRefreshing) {
          showError(state);
        }
      },
    );
    return AsyncValueWidget<VisitorDetail?>(
      loadingWidget: SafeArea(
        top: false,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextHeading6(title: 'Memuat data...', color: Colors.black),
                SizedBox(height: 10.0.sp),
                const CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ),
      ),
      value: widget.pengunjungParam.visitorType == EnumTypePengunjung.vip
          ? ref.watch(visitorDetailVipControllerProvider(
              widget.pengunjungParam.username ?? '',
              widget.pengunjungParam.idManifest ?? '',
            ))
          : widget.pengunjungParam.visitorType == EnumTypePengunjung.regular
              ? ref.watch(visitorDetailRegularControllerProvider(
                  widget.pengunjungParam.username ?? '',
                  widget.pengunjungParam.idManifest ?? '',
                ))
              : widget.pengunjungParam.visitorType == EnumTypePengunjung.aktual
                  ? ref.watch(visitorDetailRealizationControllerProvider(
                      widget.pengunjungParam.username ?? '',
                      widget.pengunjungParam.idManifest ?? '',
                    ))
                  : ref.watch(visitorDetailControllerProvider(
                      widget.pengunjungParam.username ?? '',
                      widget.pengunjungParam.idEvent ?? '',
                      widget.pengunjungParam.idManifest ?? '',
                    )),
      data: (datas) {
        return Scaffold(
          backgroundColor: AppThemeJtlc.white,
          appBar: AppBar(
            title: const Text('Detail Pengunjung'),
            centerTitle: true,
            elevation: 1.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0.sp, bottom: 5.0.sp),
                  //backgroundColor: Color(int.parse('0xFF${datas?.userBorderColor}')),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25.sp,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(int.parse('0xFF${datas?.userBorderColor}')), width: 5.0.sp),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: ExtendedImage.network(
                          datas?.imageProfileUrl ?? '',
                          width: MediaQuery.of(context).size.width * .4.sp,
                          // height: 390.0.sp,
                          fit: BoxFit.cover,
                          cache: true,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          //enableLoadState: false,
                          mode: ExtendedImageMode.gesture,
                          initGestureConfigHandler: (state) {
                            return GestureConfig(
                              minScale: 0.9,
                              animationMinScale: 0.7,
                              maxScale: 3.0,
                              animationMaxScale: 3.5,
                              speed: 1.0,
                              inertialSpeed: 100.0,
                              initialScale: 1.0,
                              inPageView: false,
                              initialAlignment: InitialAlignment.center,
                            );
                          },
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: ExtendedImage.network(
                    //   datas?.imageProfileUrl ?? '',
                    //   width: MediaQuery.of(context).size.width * .4.sp,
                    //   // height: 390.0.sp,
                    //   fit: BoxFit.cover,
                    //   cache: true,
                    //   border: Border.all(color: Color(int.parse('0xFF${datas?.userBorderColor}')), width: 5.0),
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    //   //enableLoadState: false,
                    //   mode: ExtendedImageMode.gesture,
                    //   initGestureConfigHandler: (state) {
                    //     return GestureConfig(
                    //       minScale: 0.9,
                    //       animationMinScale: 0.7,
                    //       maxScale: 3.0,
                    //       animationMaxScale: 3.5,
                    //       speed: 1.0,
                    //       inertialSpeed: 100.0,
                    //       initialScale: 1.0,
                    //       inPageView: false,
                    //       initialAlignment: InitialAlignment.center,
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ),
              if (datas?.idGateStat != EnumGateInGateOut.Expected.index)
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0.sp),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (datas?.idGateStat == EnumGateInGateOut.GateIn.index)
                                Image.asset('assets/icons/gate_in.png', width: 25.0.sp)
                              else
                                Image.asset('assets/icons/gate_out.png', width: 25.0.sp),
                              SizedBox(width: 5.0.sp),
                              TextHeading6(title: '${datas?.gateStatDesc}'),
                            ],
                          ),
                        ),
                        if (datas?.idGateStat == EnumGateInGateOut.GateIn.index)
                          TextHeading6(title: '${datas?.gateinDate}')
                        else
                          TextHeading6(title: '${datas?.gateoutDate ?? '-'}'),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 10.0.sp),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppThemeJtlc.jtlcGrayLight,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0.sp), topRight: Radius.circular(25.0.sp)),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    children: [
                      DetailItemWidget(title: 'Nama Pengguna', value: datas?.name ?? '-'),
                      DetailItemWidget(
                          title: datas?.idEmpType == EnumEmployeeType.nonEmployee.index ? 'No WA' : 'NIK',
                          value: datas?.idEmpType == EnumEmployeeType.nonEmployee.index
                              ? datas?.phone ?? '-'
                              : datas?.username ?? '-'),
                      if (datas?.idEmpType == EnumEmployeeType.nonEmployee.index)
                        DetailItemWidget(title: 'No KTP', value: datas?.idCardNumber ?? '-'),
                      DetailItemWidget(title: 'Perusahaan', value: datas?.companyName ?? '-'),
                      DetailItemWidget(title: 'Gender', value: datas?.gendername ?? '-'),
                      DetailItemWidget(title: 'Status', value: datas?.visitorTypeDesc ?? '-'),
                      DetailItemWidget(
                        title: 'Tipe Event',
                        value: datas?.requestTypeDesc ?? '-',
                        isExpired: datas?.isExpired ?? '',
                        isOts: datas?.isOts ?? '',
                      ),
                      DetailItemWidget(title: 'Gate In', value: datas?.gateinDate ?? '-'),
                      DetailItemWidget(title: 'Gate Out', value: datas?.gateoutDate ?? '-'),
                      DetailItemWidget(title: 'Tanggal Mulai Berlaku', value: datas?.validStartDate ?? '-'),
                      DetailItemWidget(title: 'Tanggal Akhir Berlaku', value: datas?.validEndDate ?? '-'),
                    ],
                  ),
                ),
              )
            ],
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            if (!isLoading)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (datas?.idGateStat == EnumGateInGateOut.GateIn.index)
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemeJtlc.gateOutButton,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      ),
                      icon: const Icon(FeatherIcons.userMinus),
                      onPressed: () {
                        doSubmit(datas);
                      },
                      label: const Text('Gate Out'),
                    )
                  else
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemeJtlc.gateInButton,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      ),
                      icon: const Icon(FeatherIcons.userPlus),
                      onPressed: () {
                        doSubmit(datas);
                      },
                      label: const TextHeading6(title: 'Gate In', color: AppThemeJtlc.white),
                    )
                ],
              )
            else
              const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }

  void doSubmit(VisitorDetail? datas) {
    if (datas?.idGateStat == EnumGateInGateOut.GateIn.index) {
      setState(() {
        isLoading = true;
      });
      ref.read(visitorPutGateOutControllerProvider.notifier).putGateOut(
            VisitorInput(
                idManifest: int.parse(widget.pengunjungParam.idManifest.toString()),
                username: datas?.username,
                idGateStat: datas?.idGateStat),
          );
    } else if (datas?.idGateStat == EnumGateInGateOut.GateOut.index ||
        datas?.idGateStat == EnumGateInGateOut.Expected.index) {
      ref.read(visitorPostGateInControllerProvider.notifier).postGateIn(
            VisitorInput(
              idAccessType: datas?.idAccessType,
              idEmpType: datas?.idEmpType,
              username: datas?.username,
              phone: datas?.phone,
              name: datas?.name,
              idEvent: widget.pengunjungParam.idEvent != null ? int.parse(widget.pengunjungParam.idEvent.toString()) : null,
              idGateStat: datas?.idGateStat,
              isExpired: datas?.isExpired,
            ),
          );
      setState(() {
        isLoading = true;
      });
    }
  }

  void doRefresh() {
    if (widget.pengunjungParam.routeName == PengunjungHariIniScreen.routeName) {
      // ref.refresh(visitorGuestControllerProvider);
      ref.invalidate(pengunjungHariIniControllerProvider);
    } else if (widget.pengunjungParam.routeName == PengunjungVipScreen.routeName) {
      // ref.refresh(visitorVipControllerProvider);
      ref.invalidate(visitorVipGenControllerProvider);
    } else if (widget.pengunjungParam.routeName == PengunjungRegularScreen.routeName) {
      // ref.refresh(visitorRegularControllerProvider);
      ref.invalidate(visitorRegularGenControllerProvider);
    } else if (widget.pengunjungParam.routeName == PengunjungAktualScreen.routeName) {
      // ref.refresh(visitorRealizationControllerProvider);
      ref.invalidate(visitorRealizationGenControllerProvider);
    }
  }

  void showError(AsyncValue<VisitorGateInOut?> state) {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: const Text('Peringatan'),
            content: Text((state.error as GeneralFailure).message.toString()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          )),
    );
  }
}
