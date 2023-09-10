import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_config/app_theme_jtlc.dart';
import '../core/domain/entities/enum_gatein_gateout.dart';
import 'text_heading6.dart';

final filterPengunjungHariIniProvider = StateProvider.autoDispose<String>((ref) => '4');
final isFilterSelected = StateProvider.autoDispose<Map<String, dynamic>>((ref) => {
      'filterValue': EnumGateInGateOut.All.index,
      'isPressed': false,
    });

class PillFilterWidget extends HookConsumerWidget {
  final String label;
  final Function()? onTap;
  final EnumGateInGateOut filterValue;
  const PillFilterWidget({Key? key, required this.label, this.onTap, required this.filterValue}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFilterSelectedState = ref.watch(isFilterSelected);
    final isPressed = useState(false);
    useListenable(isPressed);

    return InkWell(
      onTap: () {
        isPressed.value = true;
        onTap?.call();
        if (isPressed.value == true) {
          ref.read(isFilterSelected.notifier).state = {
            'filterValue': filterValue.index,
            'isPressed': isPressed.value,
          };
          ref.read(filterPengunjungHariIniProvider.notifier).state = filterValue.index.toString();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 5.0.sp),
        padding: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 10.0.sp),
        decoration: BoxDecoration(
          color: getColor(filterValue, isFilterSelectedState['filterValue'], isFilterSelectedState['isPressed']),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: Column(
          children: [
            TextHeading6(
                title: label.toUpperCase(),
                isCenter: true,
                color: (filterValue.index == EnumGateInGateOut.All.index &&
                        isFilterSelectedState['filterValue'] == EnumGateInGateOut.All.index)
                    ? AppThemeJtlc.white
                    : (isFilterSelectedState['filterValue'] == filterValue.index &&
                            isFilterSelectedState['isPressed'] == true &&
                            filterValue.index != EnumGateInGateOut.All.index)
                        ? AppThemeJtlc.white
                        : AppThemeJtlc.jtlcMute),
          ],
        ),
      ),
    );
  }

  getColor(EnumGateInGateOut filterValue, int isFilterValue, bool isFilterValuePressed) {
    return (filterValue.index == EnumGateInGateOut.All.index && isFilterValue == EnumGateInGateOut.All.index)
        ? AppThemeJtlc.orangeAccent
        : AppThemeJtlc.orangeAccent.withAlpha(
            (isFilterValue == filterValue.index &&
                    isFilterValuePressed == true &&
                    filterValue.index != EnumGateInGateOut.All.index)
                ? 255
                : 75,
          );
  }
}
