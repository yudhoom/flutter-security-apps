import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/utils.dart';
import '../../../constants/constants.dart';
import '../../auth/domain/model/login.dart';
import '../../auth/presentation/login_myjapfa/login_screen.dart';
import 'otp_controller.dart';
import 'otp_pin_code_screen.dart';

enum EnumOTPType { phone, email }

class OtpOptions extends ConsumerWidget {
  const OtpOptions({Key? key}) : super(key: key);
  static const routeName = 'otp-options-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginDataModel = ref.watch(loginObject);
    // final otpItemInfo = ref.watch(otpItemProvider);

    void doResendOtpHandler(String contact, String type) {
      ref.read(otpControllerProvider.notifier).otpGenerate(loginDataModel.username.toString(), type, contact);
      ref.read(otpItemProvider.notifier).setOtp(
        {'type': type, 'value': contact},
      );
      context.goNamed(OtpPinCodeScreen.routeName);
      // Navigator.pop(context);
    }

    return WillPopScope(
      onWillPop: () async {
        context.goNamed(OtpPinCodeScreen.routeName, extra: 'back');
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pilih Metode Verifikasi'),
            backgroundColor: AppThemeJtlc.white,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(FeatherIcons.arrowLeft),
              onPressed: () => context.goNamed(
                OtpPinCodeScreen.routeName,
                extra: 'back',
              ),
            ),
          ),
          persistentFooterButtons: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.5.h),
              child: Text(
                Constants.OTP_OPTIONS_FOOTER,
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Center(
                      child: Text(Constants.OTP_OPTIONS,
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          elevation: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            child: ListTile(
                              onTap: () {
                                doResendOtpHandler(
                                  loginDataModel.phone.toString(),
                                  EnumOTPType.phone.name,
                                );
                              },
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Kirim OTP melalui WhatsApp ke'),
                                  Text(
                                    maskingPhone(loginDataModel.phone ?? '00000000000'),
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                              leading: const Icon(Icons.whatsapp),
                            ),
                          ),
                        ),
                        Column(
                          children: (loginDataModel.emails as List<Email>).map((e) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              elevation: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                ),
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Kirim OTP melalui Email ke'),
                                      Text(maskingEmail(e.emailAddress ?? ''), style: Theme.of(context).textTheme.bodyText2),
                                    ],
                                  ),
                                  leading: const Icon(FeatherIcons.mail),
                                  onTap: () {
                                    doResendOtpHandler(e.emailAddress.toString(), EnumOTPType.email.name);
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
