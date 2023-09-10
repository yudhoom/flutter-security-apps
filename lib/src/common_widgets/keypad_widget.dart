import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_config/app_theme_jtlc.dart';
import 'sizebox_responsive.dart';

class KeyPadWidget extends StatelessWidget {
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;
  final BuildContext context;
  final int maxLength;
  final double buttonSize = 57.5.sp;
  final double buttonSizeMin = 80.0.sp;

  KeyPadWidget({
    Key? key,
    required this.onChange,
    required this.onSubmit,
    required this.pinController,
    required this.isPinLogin,
    required this.context,
    required this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1', mediaQuery),
              buttonWidget('2', mediaQuery),
              buttonWidget('3', mediaQuery),
            ],
          ),
        ),
        SizeBoxResponsive(mediaQuery: mediaQuery),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4', mediaQuery),
              buttonWidget('5', mediaQuery),
              buttonWidget('6', mediaQuery),
            ],
          ),
        ),
        SizeBoxResponsive(mediaQuery: mediaQuery),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7', mediaQuery),
              buttonWidget('8', mediaQuery),
              buttonWidget('9', mediaQuery),
            ],
          ),
        ),
        SizeBoxResponsive(mediaQuery: mediaQuery),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(FeatherIcons.xCircle, () {
                if (pinController.text.isNotEmpty) {
                  pinController.text =
                      pinController.text.substring(0, pinController.text.length - pinController.text.length);
                }
                onChange(pinController.text);
              }, mediaQuery),
              buttonWidget('0', mediaQuery),
              iconButtonWidget(
                FeatherIcons.delete,
                () {
                  if (pinController.text.isNotEmpty) {
                    pinController.text = pinController.text.substring(0, pinController.text.length - 1);
                  }
                  onChange(pinController.text);
                },
                mediaQuery,
              ),
            ],
          ),
        ),
      ],
    );
  }

  buttonWidget(String buttonText, Size mediaQuery) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: mediaQuery.width > 360.0.sp
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0.sp),
                  side: BorderSide(
                    color: AppThemeJtlc.jtlcOrange,
                    width: 1.0.sp,
                  ),
                ),
              ),
              onPressed: () {
                if (pinController.text.length <= maxLength) {
                  pinController.text = pinController.text + buttonText;
                  onChange(pinController.text);
                }
              },
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppThemeJtlc.jtlcTitleBlack,
                    fontSize: 40.sp,
                  ),
                ),
              ),
            )
          : TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150.0.sp),
                  side: BorderSide(
                    color: AppThemeJtlc.jtlcTitleBlack,
                    width: 1.0.sp,
                  ),
                ),
                side: BorderSide(
                  color: AppThemeJtlc.jtlcOrange,
                  width: 1.0.sp,
                ),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: AppThemeJtlc.jtlcTitleBlack, fontSize: 38.0.sp),
                ),
              ),
              onPressed: () {
                if (pinController.text.length <= maxLength) {
                  pinController.text = pinController.text + buttonText;
                  onChange(pinController.text);
                }
              },
            ),
    );
  }

  iconButtonWidget(IconData icon, Function? thisFunction, Size mediaQuery) {
    return InkWell(
      onTap: () => thisFunction!(),
      child: SizedBox(
        height: mediaQuery.width > 360.0.sp ? buttonSize : buttonSize,
        width: mediaQuery.width > 360.0.sp ? buttonSize : buttonSize,
        child: Container(
          height: mediaQuery.width > 360.0.sp ? buttonSize : 40.0.h,
          width: mediaQuery.width > 360.0.sp ? buttonSize : 40.0.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              size: mediaQuery.width > 360.0.sp ? 35.0.sp : 35.0.sp,
              color: AppThemeJtlc.jtlcTitleBlack,
            ),
          ),
        ),
      ),
    );
  }
}
