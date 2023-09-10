// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';

class HeaderSearchWidget extends HookConsumerWidget {
  final TextEditingController searchController;
  const HeaderSearchWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(height: 80.0.sp, color: AppThemeJtlc.jtlcGray),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (value) => doSubmitted(context),
                keyboardType: TextInputType.multiline,
                controller: searchController,
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                  hintText: 'Cari NIK/ Nama Pengunjung',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.sp),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0.sp,
                    vertical: 10.0.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: searchController.text.length > 0
                  ? InkWell(
                      onTap: () {
                        searchController.clear();
                      },
                      child: const Icon(FeatherIcons.x),
                    )
                  : const Icon(FeatherIcons.search, color: AppThemeJtlc.jtlcOrange),
            ),
          ],
        ),
      ],
    );
  }

  doSubmitted(BuildContext context) {
    showDialog(context: context, builder: (context) => const AlertDialog(title: Text('Submitted')));
  }
}
