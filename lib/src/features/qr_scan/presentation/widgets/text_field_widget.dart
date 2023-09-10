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
  final TextEditingController? paramController;
  final TextEditingController? paramSubmitController;
  final String? paramHint;
  final int? maxLines;
  final Color? paramColor;
  final int? dateRange;
  final String? initValue;
  final bool? isFill;
  final Color? fillColor;
  final int? maxLengthNumber;
  const TextFieldWidget({
    Key? key,
    required this.type,
    this.paramController,
    this.isReadOnly = false,
    this.paramSubmitController,
    this.paramHint,
    this.maxLines,
    this.paramColor,
    this.dateRange,
    this.initValue,
    this.fillColor,
    this.isFill,
    this.maxLengthNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staticHintStyle = TextStyle(fontSize: 13.0.sp);
    return Stack(children: [
      if (type == 'search')
        TextField(
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          readOnly: isReadOnly ? true : false,
          controller: paramController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9 A-Za-z]')),
          ],
          decoration: InputDecoration(
            filled: isFill,
            fillColor: fillColor,
            hintText: paramHint,
            hintStyle: staticHintStyle,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: AppThemeJtlc.jtlcOrange,
              ),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 10.0.sp),
          ),
        )
      else if (type == 'text')
        TextFormField(
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          readOnly: isReadOnly ? true : false,
          controller: paramController,
          inputFormatters: <TextInputFormatter>[
            // FilteringTextInputFormatter.allow(RegExp(r'[0-9 A-Za-z]')),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z 0-9_\-=@,\.;]')),
          ],
          decoration: InputDecoration(
            filled: isFill,
            fillColor: fillColor,
            hintText: paramHint,
            hintStyle: staticHintStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 10.0.sp),
          ),
        )
      else if (type == 'readonlyValue')
        TextFormField(
          initialValue: initValue,
          style: TextStyle(color: paramColor, fontSize: 14.0.sp),
          textInputAction: TextInputAction.newline,
          readOnly: true,
          controller: paramController,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: isFill,
            hintStyle: staticHintStyle,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0.sp,
              vertical: 0.0.sp,
            ),
          ),
        )
      else if (type == 'number')
        TextField(
          textInputAction: TextInputAction.newline,
          maxLength: maxLengthNumber,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly ? true : false,
          controller: paramController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            hintText: paramHint,
            hintStyle: staticHintStyle,
            filled: isFill,
            fillColor: fillColor,
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
            filled: isFill,
            fillColor: fillColor,
            hintText: paramHint,
            hintStyle: staticHintStyle,
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
              paramController?.text = simpleDateFormat(date.toString());
              paramSubmitController?.text = postDateFormat(date.toString());
            }
          },
          decoration: InputDecoration(
            filled: isFill,
            fillColor: fillColor,
            hintStyle: staticHintStyle,
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
              paramController?.text = simpleDateFormat(date.toString());
              paramSubmitController?.text = postDateFormat(date.toString());
            }
          },
          decoration: InputDecoration(
            filled: isFill,
            fillColor: fillColor,
            hintStyle: staticHintStyle,
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
            hintStyle: staticHintStyle,
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
