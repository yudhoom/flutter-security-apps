import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor.dart';

import '../../../common_utils/ansyn_value_widget.dart';
import '../../../common_widgets/text_heading2.dart';
import '../../home/domain/entity/visitor_total.dart';
import '../../daftar_pengunjung/presentation/visitor_controller.dart';
import '../../qr_scan/presentation/scan_qr_screen_new.dart';
import 'widgets/card_entrant_widget.dart';

final dataPengunjungProvider = StateProvider<Visitor>((ref) => const Visitor());

class Home2Screen extends StatefulHookConsumerWidget {
  const Home2Screen({super.key});
  static const routeName = 'home-2-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends ConsumerState<Home2Screen> {
  @override
  Widget build(BuildContext context) {
    final daftarPengunjungTerscanState = ref.watch(dataPengunjungTerscanProvider);
    final daftarRealization = ref.watch(visitorRealizationGenControllerProvider);
    // final daftarRealization = ref.watch(visitorRealizationControllerProvider)

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen Latihan'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // return ref.refresh(visitorRealizationControllerProvider.notifier).getVisitorRealization();
          ref.invalidate(visitorRealizationGenControllerProvider);
        },
        child: AsyncValueWidget<VisitorTotal?>(
          value: daftarRealization,
          data: (dataku) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextHeading2(title: 'Total data: ${dataku?.totalVisitor}'),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: dataku?.visitors?.length ?? 0,
                    itemBuilder: ((context, index) {
                      var datax = dataku?.visitors?[index];
                      return CardEntrantWidget(
                        datax: datax ?? const Visitor(),
                      );
                    }),
                  ),
                ),
                const Divider(),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Text('List Tampungan ada disini'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: daftarPengunjungTerscanState.length,
                          itemBuilder: ((context, index) {
                            var dataTampunganku = daftarPengunjungTerscanState[index];
                            return Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                                title: Text(dataTampunganku),
                                trailing: const Icon(FeatherIcons.user),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
