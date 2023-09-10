import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_utils/utils.dart';

final readOnlyTextFieldControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(text: 'Submit untuk mendapatkan ruangan'),
);

final dateStartTextFieldControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(text: simpleDateFormat(DateTime.now().toString())),
);

final textAreaFieldControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(text: ''),
);

class TextFieldWidget extends HookConsumerWidget {
  final String type;
  final bool isReadOnly;
  final TextEditingController paramController;
  final TextEditingController? paramSubmitController;
  final String? paramHint;
  final int? maxLines;
  final Color? paramColor;
  final int? dateRange;
  const TextFieldWidget({
    Key? key,
    required this.type,
    required this.paramController,
    this.isReadOnly = false,
    this.paramSubmitController,
    this.paramHint,
    this.maxLines,
    this.paramColor,
    this.dateRange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      if (type == 'text')
        TextField(
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          readOnly: isReadOnly ? true : false,
          controller: paramController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9 A-Za-z]')),
          ],
          decoration: InputDecoration(
            hintText: paramHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'readonlyValue')
        TextField(
          style: TextStyle(color: paramColor),
          textInputAction: TextInputAction.newline,
          readOnly: true,
          controller: paramController,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            fillColor: AppThemeJtlc.jtlcGrayLight,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'number')
        TextField(
          textInputAction: TextInputAction.newline,
          maxLength: 3,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly ? true : false,
          controller: paramController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'textarea')
        TextField(
          textInputAction: TextInputAction.done,
          controller: paramController,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            ref.read(textAreaFieldControllerProvider).text = value;
          },
          maxLines: maxLines ?? 4,
          maxLength: 200,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9 A-Za-z]')),
          ],
          decoration: InputDecoration(
            hintText: paramHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'date')
        TextField(
          textInputAction: TextInputAction.newline,
          autofocus: false,
          readOnly: true,
          showCursor: false,
          // controller: ref.watch(dateStartTextFieldControllerProvider),
          controller: paramController,
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
              lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + (dateRange ?? 0)),
            );
            if (date != null) {
              // ref.read(dateStartTextFieldControllerProvider).text = simpleDateFormat(date.toString());
              paramController.text = simpleDateFormat(date.toString());
              paramSubmitController?.text = postDateFormat(date.toString());
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'dateEnd')
        TextField(
          textInputAction: TextInputAction.newline,
          autofocus: false,
          readOnly: true,
          showCursor: false,
          controller: paramController,
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
              lastDate: DateTime(DateTime.now().year + 5),
            );
            if (date != null) {
              paramController.text = simpleDateFormat(date.toString());
              paramSubmitController?.text = postDateFormat(date.toString());
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
      else if (type == 'readonly')
        TextField(
          readOnly: true,
          style: TextStyle(
            color: AppThemeJtlc.jtlcOrange,
            fontSize: 14.0.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
          controller: ref.watch(readOnlyTextFieldControllerProvider),
          decoration: InputDecoration(
            fillColor: AppThemeJtlc.jtlcGrayLight,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0.sp),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 10.0.sp,
            ),
          ),
        )
    ]);
  }
}
