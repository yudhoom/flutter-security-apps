import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/keypad_widget.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../constants/constants.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../home/presentation/home_screen.dart';
import '../domain/model/jwt_domain.dart';
import 'login_myjapfa/login_screen.dart';
import 'pin_controller.dart';

class PinInputReloginScreen extends StatefulHookConsumerWidget {
  const PinInputReloginScreen({Key? key}) : super(key: key);
  static const routeName = 'pin-verification';

  @override
  PinInputReloginScreenState createState() => PinInputReloginScreenState();
}

class PinInputReloginScreenState extends ConsumerState<PinInputReloginScreen> {
  final pinInputConfirmController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final themeContext = Theme.of(context);
    final userInfoProvider = ref.watch(loginObject);

    ref.listen<AsyncValue<JwtDomain?>>(
      pinVerifyProvider,
      (previous, state) {
        // if (!state.isRefreshing && !state.hasError) {
        if (state is AsyncData) {
          if (state.value != null) {
            pinInputConfirmController.clear();
            pinInputConfirmController.text = '';

            UserSharedPreferences.setAccessToken(state.value?.accessToken ?? '');
            UserSharedPreferences.setRefreshToken(state.value?.refreshToken ?? '');
            UserSharedPreferences.setUsername(userInfoProvider.username ?? '');
            UserSharedPreferences.setUsernamePhone(userInfoProvider.phone ?? '');
            UserSharedPreferences.setName(userInfoProvider.name ?? '');
            UserSharedPreferences.setImageUrlAfterUpload(userInfoProvider.imageProfileUrl ?? '');
            UserSharedPreferences.setUserContact(userInfoProvider.phone.toString());
            UserSharedPreferences.setActivate('1');
            context.goNamed(HomeScreen.routeName);
            setState(() {
              _isLoading = false;
            });
          }
        }

        if (!state.isRefreshing && state.hasError) {
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
                  },
                )
              ],
            ),
          );
          setState(() {
            _isLoading = false;
          });
        }
      },
    );

    ref.listen<AsyncValue<String?>>(
      forgotPinProvider,
      (previous, state) {
        if (state is AsyncData) {
          if (state.value != null) {
            pinInputConfirmController.clear();
            pinInputConfirmController.text = '';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.value}'),
                duration: const Duration(seconds: 1),
              ),
            );
            UserSharedPreferences.setActivate('0');
            context.goNamed(LoginScreen.routeName);
          }
        }

        if (state is AsyncError) {
          showDialog(
            context: context,
            builder: (contextDialog) => AlertDialog(
              title: const Text('Peringatan'),
              content: TextHeading6(title: (state.error as GeneralFailure).message.toString()),
              actions: [
                OkButton(
                  someFunction: () {
                    Navigator.pop(contextDialog);
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
          extendBodyBehindAppBar: false,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                // Text(
                //   'MyJAPFA',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 25.sp,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                child: Image.asset('assets/images/japfa_logo1.png'),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0.h),
                  child: Text(
                    'Masukkan PIN Anda',
                    style: themeContext.textTheme.bodyText1,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005.sp,
                    left: 30.sp,
                    right: 30.sp,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: pinInputConfirmController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          textAlign: TextAlign.center,
                          style: themeContext.textTheme.headline6,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: '****',
                            hintStyle: TextStyle(fontSize: 16.0.sp),
                          ),
                        ),
                ),
              ),
              Expanded(
                flex: 4,
                child: KeyPadWidget(
                  isPinLogin: false,
                  onChange: (String pin) {
                    pinInputConfirmController.text = pin;
                    if (pinInputConfirmController.text.length == 4) {
                      setState(() {
                        _isLoading = true;
                      });
                      _verificationPinHandler(pinInputConfirmController.text);
                      pinInputConfirmController.clear();
                    }
                  },
                  onSubmit: () {},
                  pinController: pinInputConfirmController,
                  context: context,
                  maxLength: 3,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const TextHeading5(
                            title: 'Lupa PIN ?',
                            color: AppThemeJtlc.jtlcBlueDark,
                          ),
                          content: const Text(
                            Constants.WRONG_PIN_RESET,
                          ),
                          actions: [
                            CancelButton(
                              label: 'Kembali',
                              dialogContext: dialogContext,
                            ),
                            !_isLoading
                                ? OkButton(
                                    label: 'Ya',
                                    someFunction: () async {
                                      await UserSharedPreferences.setActivate('0');
                                      ref.read(forgotPinProvider.notifier).forgotPin();
                                      setState(() {
                                        _isLoading = true;
                                      });
                                    },
                                    dialogContext: dialogContext,
                                  )
                                : const SizedBox()
                          ],
                        ),
                      );
                    },
                    child: const TextHeading5(
                      title: 'Lupa PIN ?',
                      color: AppThemeJtlc.jtlcBlueDark,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _doBackToLogin() async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Kembali ke Login?'),
        content: const Text(Constants.BACK_TO_LOGIN),
        actions: [
          CancelButton(label: 'Batal', dialogContext: dialogContext),
          OkButton(
            label: 'Ya',
            someFunction: () {
              Navigator.of(dialogContext).pop();
              context.goNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  void _verificationPinHandler(String pin) {
    setState(() {
      _isLoading = true;
    });
    ref.read(pinVerifyProvider.notifier).verifyPin(pin);
  }
}
