import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/utils.dart';
import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/keypad_widget.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../constants/constants.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../auth/domain/model/login.dart';
import '../../auth/presentation/login_myjapfa/login_screen.dart';
import '../../auth/presentation/pin_input_default_screen.dart';
import '../../auth/presentation/pin_input_relogin_screen.dart';
import 'otp_controller.dart';
import 'otp_options_screen.dart';
import 'otp_verify_controller.dart';
import 'widgets/timer_widget.dart';

class OtpPinCodeScreen extends StatefulHookConsumerWidget {
  final String? isBack;
  const OtpPinCodeScreen({
    Key? key,
    this.isBack,
  }) : super(key: key);
  static const routeName = 'otp-pin-code-screen';

  @override
  OtpPinCodeScreenState createState() => OtpPinCodeScreenState();
}

class OtpPinCodeScreenState extends ConsumerState<OtpPinCodeScreen> {
  bool _isLoading = false;
  final _pinInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pinInputController.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final loginAuthInfo = ref.watch(loginObject);
    final otpItemInfo = ref.watch(otpItemProvider);

    ref.listen<AsyncValue<String?>>(
      otpVerifyProvider,
      (previous, state) {
        if (state is AsyncData) {
          var login = loginAuthInfo;
          validateChangePassword(context, ref, login);
          setState(() {
            _isLoading = false;
          });
        }

        if (state is AsyncError) {
          _pinInputController.clear();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (contextDialog) => AlertDialog(
              title: const Text('Peringatan'),
              content: TextHeading6(title: (state.error as GeneralFailure).message.toString()),
              actions: [
                OkButton(
                  someFunction: () {
                    Navigator.of(contextDialog).pop();
                    setState(() {
                      _isLoading = false;
                    });
                  },
                )
              ],
            ),
          );
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        await _doBackToLogin();
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppThemeJtlc.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            foregroundColor: AppThemeJtlc.jtlcTitleBlack,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                _doBackToLogin();
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Image.asset('assets/images/japfa_logo1.png'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                child: const Text(
                  'Masukkan Kode OTP',
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    otpItemInfo['type'] == 'email'
                        ? Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                'Kode OTP telah dikirimkan ke',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                maskingEmail(otpItemInfo['value'].toString()),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Wrap(direction: Axis.vertical, crossAxisAlignment: WrapCrossAlignment.center, children: [
                            const Text(
                              'Kode OTP telah dikirimkan ke',
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0.sp),
                              child: Text(
                                maskingPhone(otpItemInfo['value'].toString()),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.005.sp,
                  left: 30.sp,
                  right: 30.sp,
                ),
                child: PinCodeTextField(
                  textStyle: const TextStyle(),
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    inactiveColor: AppThemeJtlc.jtlcOrange,
                    activeColor: Colors.teal,
                  ),
                  animationDuration: const Duration(milliseconds: 250),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: false,
                  controller: _pinInputController,
                  onCompleted: (v) {
                    _onCompleted(
                      v,
                      loginAuthInfo.username.toString(),
                      context,
                      loginAuthInfo,
                    );
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              TimerWidget(
                isBack: widget.isBack,
                doKirimUlangOtp: () => ref.read(otpControllerProvider.notifier).otpGenerate(
                      loginAuthInfo.username ?? '',
                      otpItemInfo['type'] ?? '',
                      otpItemInfo['value'] ?? '',
                    ),
              ),
              Expanded(
                flex: 4,
                child: !_isLoading
                    ? KeyPadWidget(
                        isPinLogin: false,
                        onChange: (String pin) {
                          _pinInputController.text = pin;
                          if (_pinInputController.text.length == 6) {
                            _pinInputController.clear();
                          }
                        },
                        onSubmit: () {
                          _onCompleted(
                            _pinInputController.text,
                            loginAuthInfo.username.toString(),
                            context,
                            loginAuthInfo,
                          );
                        },
                        pinController: _pinInputController,
                        context: context,
                        maxLength: 6,
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return StatefulBuilder(
                          builder: (ctx, setState) {
                            return AlertDialog(
                              title: Row(
                                children: const [
                                  Text("Konfirmasi"),
                                ],
                              ),
                              content: Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                                child: const Text(Constants.OTHERS_OTP_CONFIRM),
                              ),
                              actions: [
                                CancelButton(
                                  label: 'Lanjutkan',
                                  dialogContext: dialogContext,
                                ),
                                TextButton(
                                  child: Text("Cara Lain", style: Theme.of(context).textTheme.button),
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    dialogContext.goNamed(OtpOptions.routeName);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: const TextHeading5(
                    title: 'Tidak menerima OTP ?',
                    color: AppThemeJtlc.jtlcBlueDark,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCompleted(
    String pin,
    String username,
    BuildContext context,
    Login loginAuthInfo,
  ) {
    setState(() {
      _isLoading = true;
    });
    ref.read(otpVerifyProvider.notifier).verifyOtp(username, pin);
  }

  void showNotifDialog(String? errMessage, BuildContext thisContext) {
    showDialog(
      barrierDismissible: false,
      context: thisContext,
      builder: (thisContext) => AlertDialog(
        title: const Text('Kode OTP Salah'),
        content: const Text(
          Constants.INVALID_OTP,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(thisContext).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _doBackToLogin() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text(Constants.BACK_TO_LOGIN),
        actions: [
          CancelButton(
            label: 'Tidak',
            dialogContext: dialogContext,
          ),
          OkButton(
            label: 'Ya',
            someFunction: () {
              context.goNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  doResetTimer(int counter) {
    const oneSec = Duration(seconds: 2);
    Timer.periodic(
      oneSec,
      (timer) {
        if (counter == 0) {
          timer.cancel();
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  void validateChangePassword(BuildContext context, WidgetRef ref, Login? state) {
    if (state?.isChangePassword == 'N') {
      context.goNamed(PinInputDefaultScreen.routeName);
      ref.read(isLoadingProvider.notifier).state = false;
    } else {
      if (state?.imageAvailable == true) {
        UserSharedPreferences.setSelfieStatus('${state?.username.toString()}true');
      } else {
        UserSharedPreferences.setSelfieStatus('');
      }
      ref.read(loginObject.notifier).state = state as Login;
      ref.read(usernameProvider.notifier).state = state.username ?? '';
      context.goNamed(PinInputReloginScreen.routeName);
    }
  }
}
