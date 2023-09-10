import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/ansyn_value_widget.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../daftar_pengunjung/domain/enum_pengunjung.dart';
import '../../daftar_pengunjung/domain/pengunjung_param.dart';
import '../../daftar_pengunjung/presentation/visitor_detail_controller.dart';
import '../../daftar_pengunjung/presentation/widgets/detail_item_widget.dart';
import '../../home/domain/entity/visitor_detail.dart';

class VisitorDetailScreen extends StatefulHookConsumerWidget {
  final PengunjungParam pengunjungParam;
  const VisitorDetailScreen({
    super.key,
    required this.pengunjungParam,
  });

  static const routeName = 'visitor-detail-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VisitorDetailScreenState();
}

class _VisitorDetailScreenState extends ConsumerState<VisitorDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0.sp, bottom: 5.0.sp),
                    child: CircleAvatar(
                      radius: 95.0.w,
                      backgroundColor: Color(int.parse('0xFF${datas?.userBorderColor}')),
                      child: CircleAvatar(
                        radius: 90.0.sp,
                        backgroundColor: AppThemeJtlc.jtlcGray,
                        backgroundImage: CachedNetworkImageProvider(
                          datas?.imageProfileUrl ?? '',
                        ),
                        // CachedNetworkImage(
                        //     imageUrl: datas?.imageProfileUrl ?? '',
                        //     fit: BoxFit.cover,
                        //     progressIndicatorBuilder: (context, url, downloadProgress) =>
                        //         Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        //     errorWidget: (context, url, error) => const Icon(FeatherIcons.user, color: Colors.red),
                        //   )
                      ),
                    ),
                  ),
                ),
                // // if (datas?.idGateStat != EnumGateInGateOut.Expected.index)
                // //   Expanded(
                //     flex: 0,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(vertical: 0.0.sp),
                //       child: Column(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 8.0.sp),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 if (datas?.idGateStat == EnumGateInGateOut.GateIn.index)
                //                   Image.asset('assets/icons/gate_in.png', width: 25.0.sp)
                //                 else
                //                   Image.asset('assets/icons/gate_out.png', width: 25.0.sp),
                //                 SizedBox(width: 5.0.sp),
                //                 TextHeading6(title: '${datas?.gateStatDesc}'),
                //               ],
                //             ),
                //           ),
                //           if (datas?.idGateStat == EnumGateInGateOut.GateIn.index)
                //             TextHeading6(title: '${datas?.gateinDate}')
                //           else
                //             TextHeading6(title: '${datas?.gateoutDate ?? '-'}'),
                //         ],
                //       ),
                //     ),
                //   ),
                SizedBox(height: 10.0.sp),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppThemeJtlc.jtlcGrayLight,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0.sp), topRight: Radius.circular(25.0.sp)),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                      children: [
                        DetailItemWidget(title: 'Nama Pengguna', value: datas?.name ?? '-'),
                        DetailItemWidget(title: 'NIK', value: datas?.username ?? '-'),
                        DetailItemWidget(title: 'Perusahaan', value: datas?.companyName ?? '-'),
                        DetailItemWidget(title: 'Gender', value: datas?.gendername ?? '-'),
                        DetailItemWidget(title: 'Status', value: datas?.visitorTypeDesc ?? '-'),
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
          ),
        );
      },
    );
  }
}
