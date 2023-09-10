import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/features/goshow/domain/entities/direct_spv.dart';
import 'package:logger/logger.dart';

class SearchSuggestionsWidget extends HookConsumerWidget {
  final Function doClosedList;
  final List<DirectSpv> employeeDataTampunganState;
  final TextEditingController mineKeywordController;
  final Function(DirectSpv) doAddToTemporary;
  const SearchSuggestionsWidget({
    super.key,
    required this.doClosedList,
    required this.employeeDataTampunganState,
    required this.mineKeywordController,
    required this.doAddToTemporary,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Logger().w('onTap');
        doClosedList.call();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08.sp,
          left: 25.0.sp,
          right: 25.0.sp,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: employeeDataTampunganState.asMap().entries.map((e) {
              var dataku = e.value;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    doAddToTemporary(dataku);
                    doClosedList.call();
                    mineKeywordController.clear();
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        e.value.imageProfileUrl ?? 'https://www.w3schools.com/howto/img_avatar.png',
                      ),
                    ),
                    title: Text(e.value.empname ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.value.empid ?? ''),
                        Text(e.value.compcodename ?? ''),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
