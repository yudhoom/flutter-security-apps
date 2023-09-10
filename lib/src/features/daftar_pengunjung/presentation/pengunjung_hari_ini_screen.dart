import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/constants/constants.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_hari_ini_controller.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_utils/ansyn_value_widget.dart';
import '../../../common_widgets/card_entrant_view_widget.dart';
import '../../../common_widgets/pill_filter_widget.dart';
import '../../../core/domain/entities/enum_gatein_gateout.dart';
import '../../home/domain/entity/visitor.dart';
import '../../home/domain/entity/visitor_total.dart';
import '../domain/enum_pengunjung.dart';
import '../domain/pengunjung_param.dart';
import 'pengunjung_detail_screen.dart';
import 'visitor_controller.dart';
import 'widgets/header_search_widget.dart';
import 'widgets/header_widget.dart';

class PengunjungHariIniScreen extends HookConsumerWidget {
  final String paramsId;
  const PengunjungHariIniScreen({
    Key? key,
    required this.paramsId,
  }) : super(key: key);
  static const routeName = 'pengunjung-hari-ini-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);
    // final visitorGuestState = ref.watch(visitorGuestControllerProvider);
    final visitorGuestState = ref.watch(pengunjungHariIniControllerProvider);
    final filterTerpilihState = ref.watch(filterPengunjungHariIniProvider);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Pengunjung Hari Ini'),
        ),
        body: KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
            GestureType.onTapDown,
          ],
          child: RefreshIndicator(
            onRefresh: () async {
              // ref.refresh(visitorGuestControllerProvider);
              ref.invalidate(pengunjungHariIniControllerProvider);
            },
            child: AsyncValueWidget<VisitorTotal?>(
                value: visitorGuestState,
                data: (datas) {
                  List<Visitor> datasTmp = [...datas?.visitors ?? []];
                  if (searchController.text.isNotEmpty) {
                    datasTmp = datasTmp.where((element) {
                      return element.name!.toLowerCase().contains(
                                searchController.text.toLowerCase(),
                              ) ||
                          element.username!.toLowerCase().contains(
                                searchController.text.toLowerCase(),
                              );
                    }).toList();
                  }
                  if (filterTerpilihState != EnumGateInGateOut.All.index.toString() && filterTerpilihState != '') {
                    if (filterTerpilihState == EnumGateInGateOut.OnTheSpot.index.toString()) {
                      datasTmp = datasTmp.where((element) {
                        return element.isOts == 'Y';
                      }).toList();
                    } else {
                      datasTmp = datasTmp.where((element) {
                        return element.idGateStat.toString() == filterTerpilihState;
                      }).toList();
                    }
                  }
                  var totalData = datas?.totalVisitor ?? 0;
                  return Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: HeaderWidget(
                          type: EnumTypePengunjung.hariIni,
                          totalCounter: totalData,
                        ),
                      ),
                      Expanded(flex: 0, child: HeaderSearchWidget(searchController: searchController)),
                      Expanded(
                        flex: 0,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.sp, vertical: 0.0.sp),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              PillFilterWidget(label: 'All', filterValue: EnumGateInGateOut.All),
                              PillFilterWidget(label: 'Baru', filterValue: EnumGateInGateOut.Expected),
                              PillFilterWidget(label: 'Gate In', filterValue: EnumGateInGateOut.GateIn),
                              PillFilterWidget(label: 'Gate Out', filterValue: EnumGateInGateOut.GateOut),
                              PillFilterWidget(label: 'On The Spot', filterValue: EnumGateInGateOut.OnTheSpot),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: datasTmp.isNotEmpty
                            ? ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 0.0.sp),
                                itemCount: datasTmp.length,
                                itemBuilder: ((context, index) {
                                  final dataku = datasTmp[index];
                                  return InkWell(
                                    onTap: () => context.pushNamed(
                                      PengunjungDetailScreen.routeName,
                                      extra: PengunjungParam(
                                        username: dataku.username,
                                        idEvent: dataku.idEvent.toString(),
                                        idManifest: dataku.idManifest.toString(),
                                        visitorType: EnumTypePengunjung.hariIni,
                                        routeName: PengunjungHariIniScreen.routeName,
                                      ),
                                    ),
                                    child: CardEntrantViewWidget(
                                      empid: dataku.username ?? '',
                                      name: dataku.name ?? '',
                                      gender: dataku.gendername ?? '',
                                      tipePengunjung: dataku.visitorTypeDesc ?? '',
                                      gateInGateOut: dataku.idGateStat,
                                      onTapFunction: () {},
                                      isExpired: dataku.isExpired ?? 'N',
                                      isOts: dataku.isOts ?? 'N',
                                      isStayDesc: '',
                                    ),
                                  );
                                }),
                                separatorBuilder: ((context, index) => SizedBox(height: 7.5.sp)),
                              )
                            : const Center(child: Text(Constants.NO_SEARCH_OR_FILTER)),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
