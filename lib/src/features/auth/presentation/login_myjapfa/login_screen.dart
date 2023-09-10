// ignore_for_file: library_private_types_in_public_api, unused_element, prefer_is_empty

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/features/otp/presentation/otp_pin_code_screen.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:logger/logger.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/network_detector_notifier.dart';
import '../../../../common_widgets/text_heading6.dart';
import '../../../../common_widgets/text_heading7.dart';
import '../../../../core/client/failure.dart';
import '../../../../core/domain/user_shared_preferences.dart';
import '../../../../error_handling/no_internet_connection.dart';
import '../../../otp/presentation/otp_controller.dart';
import '../../../otp/presentation/otp_options_screen.dart';
import '../../domain/model/login.dart';
import '../login_gen_controller.dart';
import '../pin_input_default_screen.dart';
import '../pin_input_relogin_screen.dart';

final loginObject = StateProvider<Login>((ref) => const Login());
final usernameProvider = StateProvider<String>((ref) => '');
final isLoadingProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);
    // var isLoading = useState(false);
    // useListenable(isLoading);
    Logger().i('[LoginScreen build]: Widget build: $isLoading');
    var usernameController = useTextEditingController();
    useListenable(usernameController);

    // useEffect(
    //   () {
    //     ref.read(isLoadingProvider.notifier).state = false;
    //   },
    //   [isLoading],
    // );

    ref.listen<AsyncValue<Login?>>(
      loginGenControllerProvider,
      (previous, state) {
        // if (state is AsyncLoading) {
        //   ref.read(isLoadingProvider.notifier).state = true;
        // }
        if (state is AsyncData) {
          // final prefs = SharedPreferences.getInstance();
          // ref.read(isLoadingProvider.notifier).state = true;
          Logger().wtf('---------------------------AsyncData: ${state.value.toString()}');
          UserSharedPreferences.setUsername(state.value?.username ?? '');
          UserSharedPreferences.setUsernamePhone(state.value?.phone ?? '');
          UserSharedPreferences.setName(state.value?.name ?? '');
          UserSharedPreferences.setImageUrlAfterUpload(state.value?.imageProfileUrl ?? '');
          UserSharedPreferences.setUsername(state.value?.username ?? '');
          UserSharedPreferences.setUsernamePhone(state.value?.phone ?? '');
          ref.read(otpItemProvider.notifier).setOtp({
            'type': EnumOTPType.phone.name,
            'value': (state.value as Login).phone.toString(),
          });
          ref
              .read(otpControllerProvider.notifier)
              .otpGenerate(state.value?.username ?? '', 'phone', state.value?.phone ?? '');
          // ini sebelum ada OTP on 5/12/2022
          // validateChangePassword(context, ref, state);

          // arahkan ke OTP on 5/12/2022
          ref.read(isLoadingProvider.notifier).state = false;
          ref.read(loginObject.notifier).state = state.value as Login;
          ref.read(usernameProvider.notifier).state = state.value?.username ?? '';
          context.goNamed(OtpPinCodeScreen.routeName);
        }

        if (state is AsyncError) {
          // Logger().w('error: ${(state.error as GeneralFailure).message}');
          showError(context, (state.error as GeneralFailure).message);
          ref.read(isLoadingProvider.notifier).state = false;
          // setState(() {
          // });
        }
      },
    );

    var network = ref.watch(networkAwareProvider);
    if (network == NetworkStatus.Off) {
      return const SafeArea(
        child: NoInternetConnection(),
      );
    } else {
      return WillPopScope(
        onWillPop: () async {
          doExit(context);
          return false;
        },
        child: SafeArea(
          top: false,
          child: KeyboardDismisser(
            gestures: const [
              GestureType.onTap,
              GestureType.onTapDown,
            ],
            child: Scaffold(
              backgroundColor: AppThemeJtlc.white,
              resizeToAvoidBottomInset: false,
              persistentFooterButtons: const [
                Center(child: TextHeading7(title: '© 2022, PT. Japfa Comfeed Indonesia, TBK')),
              ],
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(flex: 1, child: Image.asset('assets/images/japfa_logo.png', width: 200.0.w)),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 55.0.sp,
                            vertical: 12.0.sp,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                FeatherIcons.user,
                                color: AppThemeJtlc.jtlcOrange,
                                size: 16.0.sp,
                              ),
                              const TextHeading7(
                                title: 'LOGIN',
                                color: AppThemeJtlc.jtlcOrange,
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.0.sp,
                          ),
                          child: Column(
                            children: [
                              TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\+]')),
                                ],
                                maxLength: 16,
                                controller: usernameController,
                                decoration: InputDecoration(
                                  suffixIcon: usernameController.text.length > 0
                                      ? IconButton(
                                          icon: const Icon(
                                            FeatherIcons.x,
                                            color: AppThemeJtlc.jtlcOrange,
                                          ),
                                          onPressed: () {
                                            usernameController.clear();
                                          },
                                        )
                                      : null,
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0.sp,
                                    vertical: 5.0.sp,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0.sp),
                                  ),
                                  labelText: 'ID Security',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0.sp),
                              if (!isLoading)
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppThemeJtlc.jtlcHeadingBlack,
                                    ),
                                    onPressed: () {
                                      ref.read(isLoadingProvider.notifier).state = true;
                                      Future.delayed(const Duration(seconds: 1), () {
                                        _doLogin(
                                          usernameController,
                                          isLoading,
                                          context,
                                          ref,
                                        );
                                      });
                                    },
                                    child: const Text('Masuk'),
                                  ),
                                )
                              else
                                const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.0.sp),
                          child: Container(
                            width: 100.0.w,
                            height: MediaQuery.of(context).size.height * 0.3.sp,
                            color: AppThemeJtlc.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void _doLogin(
    TextEditingController usernameController,
    bool isLoading,
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (isValid(usernameController, context)) {
      ref.read(loginGenControllerProvider.notifier).authLogin(usernameController.text.trim());
      // ref.read(loginGenControllerProvider.notifier).authLogin(myUserEncrypted);
      // loginNotifier.authLogin(usernameController.text).whenComplete(() {
      //   final myState = loginNotifier.state;
      //   UserSecureStorage.setUsername(myState.value?.username ?? '');
      //   UserSecureStorage.setUsernamePhone(myState.value?.phone ?? '');
      //   UserSecureStorage.setName(myState.value?.name ?? '');
      //   UserSecureStorage.setImageUrlAfterUpload(myState.value?.imageProfileUrl ?? '');
      //   if (myState.value?.isChangePassword == 'N') {
      //     context.goNamed(PinInputDefaultScreen.routeName);
      //   } else {
      //     if (myState.value?.imageAvailable == true) {
      //       UserSecureStorage.setSelfieStatus('${myState.value?.username.toString()}true');
      //     } else {
      //       UserSecureStorage.setSelfieStatus('');
      //     }
      //     ref.read(loginObject.notifier).state = myState.value as Login;
      //     ref.read(usernameProvider.notifier).state = myState.value?.username ?? '';
      //     context.goNamed(PinInputReloginScreen.routeName);
      //   }
      // }).onError((error, stackTrace) {
      //   showError(context, (loginNotifier.state.error as GeneralFailure).message);
      //   isLoading.value = false;
      // });
    }
  }

  bool isValid(TextEditingController usernameController, BuildContext context) {
    bool validStatus = false;
    if (usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Maaf, ID Security harus diisi'),
          backgroundColor: Colors.red.shade900,
        ),
      );
    } else if (usernameController.text.trim().length <= 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('ID yang dimasukkan minimal 8 karakter'),
          backgroundColor: Colors.red.shade900,
        ),
      );
    } else {
      validStatus = true;
    }

    return validStatus;
  }

  void showError(BuildContext context, Object? error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text('Peringatan'),
        content: const TextHeading6(title: 'Terjadi kesalahan, silahkan coba lagi atau hubungi administrator'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(contextDialog).pop();
            },
          ),
        ],
      ),
    );
  }

  void doExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const TextHeading6(title: 'Apakah anda yakin ingin keluar?'),
        actions: [
          TextButton(
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(contextDialog).pop();
            },
          ),
          TextButton(
            child: const Text('Ya'),
            onPressed: () {
              SystemNavigator.pop();
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  // String getEncryptedUser(String username) {
  //   final plainText = username.toString();
  //   final key = myEncrypt.Key.fromUtf8('my 32 length key................');
  //   final iv = myEncrypt.IV.fromLength(16);

  //   final encrypter = myEncrypt.Encrypter(myEncrypt.AES(key, mode: myEncrypt.AESMode.cbc));

  //   final encrypted = encrypter.encrypt(plainText, iv: iv);
  //   final decrypted = encrypter.decrypt(encrypted, iv: iv);

  //   print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  //   print(encrypted.base64);

  //   return encrypted.base64;
  // }

  void validateChangePassword(BuildContext context, WidgetRef ref, AsyncValue<Login?> state) {
    if (state.value?.isChangePassword == 'N') {
      context.goNamed(PinInputDefaultScreen.routeName);
      ref.read(isLoadingProvider.notifier).state = false;
    } else {
      if (state.value?.imageAvailable == true) {
        UserSharedPreferences.setSelfieStatus('${state.value?.username.toString()}true');
      } else {
        UserSharedPreferences.setSelfieStatus('');
      }
      ref.read(loginObject.notifier).state = state.value as Login;
      ref.read(usernameProvider.notifier).state = state.value?.username ?? '';
      context.goNamed(PinInputReloginScreen.routeName);
    }
  }
}
