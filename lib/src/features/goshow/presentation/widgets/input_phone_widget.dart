import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class InputPhoneWidget extends StatefulHookConsumerWidget {
  const InputPhoneWidget({super.key});

  @override
  InputPhoneWidgetState createState() => InputPhoneWidgetState();
}

class InputPhoneWidgetState extends ConsumerState<InputPhoneWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var phoneController = useTextEditingController();
    var defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.sp, vertical: 15.0.sp);

    return Container(
      padding: defaultHorizontalPadding,
      child: IntlPhoneField(
        textInputAction: TextInputAction.go,
        controller: phoneController,
        initialCountryCode: 'ID',
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        validator: (value) {
          var inputLength = value?.number.length ?? 0;
          if (inputLength > 15) {
            return 'Nomor telepon tidak boleh lebih dari 15 digit';
          }
          return null;
        },
        decoration: InputDecoration(
            counterText: "",
            labelText: 'Cari Nomor',
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
            ),
            suffixIcon: isLoading ? const FittedBox(child: CircularProgressIndicator.adaptive()) : const SizedBox.shrink()),
        onChanged: (phone) {
          // print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          setState(() {
            // selectedCountryCode = '+${country.dialCode}';
          });
        },
        disableLengthCheck: true,
      ),
    );
  }
}
