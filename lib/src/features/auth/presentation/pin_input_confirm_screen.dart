import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/keypad_widget.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../constants/constants.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../home/presentation/home_screen.dart';
import '../domain/model/jwt_domain.dart';
import 'login_myjapfa/login_screen.dart';
import 'pin_controller.dart';
import 'weak_pin_controller.dart';

class PinInputConfirmScreen extends StatefulHookConsumerWidget {
  const PinInputConfirmScreen({Key? key}) : super(key: key);
  static const routeName = 'pin-confirm-screen';

  @override
  PinInputConfirmScreenState createState() => PinInputConfirmScreenState();
}

class PinInputConfirmScreenState extends ConsumerState<PinInputConfirmScreen> {
  bool _isLoading = false;
  final pinInputConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final themeContext = Theme.of(context);
    final pinInputConsumer = ref.watch(pinInputProvider);
    final userInfoProvider = ref.watch(loginObject);

    ref.listen<AsyncValue<JwtDomain?>>(
      // pinManageProvider,
      pinCreationGenControllerProvider,
      (previous, state) {
        if (state is AsyncData) {
          pinInputConfirmController.clear();
          pinInputConfirmController.text = '';
          UserSharedPreferences.setActivate('1');
          UserSharedPreferences.setAccessToken(state.value?.accessToken ?? '');
          UserSharedPreferences.setRefreshToken(state.value?.refreshToken ?? '');
          UserSharedPreferences.setUsername(userInfoProvider.username ?? '');
          UserSharedPreferences.setUsernamePhone(userInfoProvider.phone ?? '');
          UserSharedPreferences.setName(userInfoProvider.name ?? '');
          UserSharedPreferences.setImageUrlAfterUpload(userInfoProvider.imageProfileUrl ?? '');
          UserSharedPreferences.setUserContact(userInfoProvider.phone.toString());

          context.goNamed(HomeScreen.routeName);
          setState(() {
            _isLoading = false;
          });
        }

        if (state is AsyncError) {
          showDialog(
            context: context,
            builder: (contextDialog) => AlertDialog(
              title: const Text('Peringatan'),
              content: TextHeading6(title: (state.error as GeneralFailure).message.toString()),
            ),
          );
          setState(() {
            _isLoading = false;
          });
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        // await _doBackToLogin();
        // return false;
        return true;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppThemeJtlc.white,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            foregroundColor: AppThemeJtlc.jtlcTitleBlack,
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
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0.sp),
                    child: SvgPicture.asset('assets/icons/step3.svg'),
                  )),
              Expanded(
                flex: 0,
                child: Image.asset('assets/images/japfa_logo1.png'),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Konfirmasi PIN Baru Anda',
                        style: themeContext.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: !_isLoading
                    ? TextField(
                        readOnly: true,
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
                      )
                    : const Center(child: CircularProgressIndicator.adaptive()),
              ),
              Expanded(
                flex: 4,
                child: KeyPadWidget(
                  isPinLogin: false,
                  pinController: pinInputConfirmController,
                  onChange: (String pin) {
                    pinInputConfirmController.text = pin;
                    if (pinInputConfirmController.text.length == 4) {
                      if (int.parse(pinInputConsumer) != int.parse(pinInputConfirmController.text)) {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Row(
                              children: const [
                                Text('PIN Anda tidak cocok'),
                              ],
                            ),
                            content: const Text(Constants.PIN_NOT_MATCH),
                            actions: [
                              TextButton(
                                // onPressed: () => Get.back(),
                                onPressed: () => Navigator.pop(dialogContext),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        _createPinHandler(pinInputConfirmController.text);
                      }
                      pinInputConfirmController.clear();
                    }
                  },
                  onSubmit: () {},
                  context: context,
                  maxLength: 3,
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(height: 10.0.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _createPinHandler(String pinInputConfirmController, LoginDataModel loginUserProvider) async {
  //   var api = Api();
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Response res = await api.api
  //         .post('/pin/create', data: {'username': loginUserProvider.username, 'pin': pinInputConfirmController});

  //     Map resBody = res.data['data'];
  //     setState(() {
  //       _isLoading = false;
  //     });

  //     /**buggy, better closed this message */
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   const SnackBar(
  //     //     content: Text('PIN Anda berhasil dibuat'),
  //     //     duration: Duration(seconds: 2),
  //     //   ),
  //     // );

  //     await UserSecureStorage.setActivated(EnumUserActivation.activated.name);
  //     await UserSecureStorage.setAccessToken(resBody['access_token']);
  //     await UserSecureStorage.setRefreshToken(resBody['refresh_token']);
  //     await UserSecureStorage.setStatusResetPIN(EnumUserResetStatusPIN.alive.name);
  //     await UserSecureStorage.setUsername(loginUserProvider.username!);
  //     await UserSecureStorage.setSureName(loginUserProvider.name!);
  //     await UserSecureStorage.setLastLoginRole(loginUserProvider.user_role.toString());
  //     // ref.read(userProfileProvider.notifier).setJwt(resBody['access_token'], resBody['refresh_token']);

  //     // ignore: todo
  //     if (loginUserProvider.user_role == EnumUserRole.passenger.name) {
  //       // Navigator.pushAndRemoveUntil(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //       builder: (context) => const MainPassengerScreen(
  //       //             isAccessFromLogin: true,
  //       //           )),
  //       //   (route) => false,
  //       // );
  //     } else {
  //       // Navigator.pushAndRemoveUntil(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => const MainDriverScreen()),
  //       //   (Route<dynamic> route) => false,
  //       // );
  //       // Navigator.pushAndRemoveUntil(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => const MainDriverScreen()),
  //       //   (route) => false,
  //       // );
  //     }
  //   } on DioError catch (e) {
  //     Logger().e(e);
  //     // if (e.message == Constants.NO_INTERNET) {
  //     //   ref.read(loginAuthProvider.notifier).noInternetConnection(context);
  //     //   return;
  //     // } else if (e.message == Constants.SERVER_TIMEOUT) {
  //     //   ref.read(loginAuthProvider.notifier).serverTimeout(context);
  //     //   return;
  //     // } else if (e.message == Constants.UNAUTHORIZED) {
  //     //   ref.read(loginAuthProvider.notifier).forceLogout(context);
  //     //   return;
  //     // } else if (e.response?.statusCode == 400) {
  //     //   showDialog(
  //     //     context: context,
  //     //     builder: (dialogContext) => AlertDialog(
  //     //       title: Row(
  //     //         children: const [Text('Maaf')],
  //     //       ),
  //     //       content: Text(e.response?.data['message']),
  //     //       actions: [
  //     //         OkButton(
  //     //           label: 'OK',
  //     //           dialogContext: dialogContext,
  //     //         )
  //     //       ],
  //     //     ),
  //     //   );
  //     // } else {
  //     //   if (e.response?.statusCode == 500) {
  //     //     ref.read(loginAuthProvider.notifier).serverError(context);
  //     //   } else {
  //     //     showDialog(
  //     //       context: context,
  //     //       builder: (dialogContext) => AlertDialog(
  //     //         title: Row(
  //     //           children: const [
  //     //             Text('Gagal membuat PIN'),
  //     //           ],
  //     //         ),
  //     //         content: const Text(Constants.PIN_CREATE_FAILED),
  //     //         actions: [
  //     //           TextButton(
  //     //             onPressed: () => Navigator.pop(dialogContext),
  //     //             child: const Text('OK'),
  //     //           ),
  //     //         ],
  //     //       ),
  //     //     );
  //     //   }
  //     }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  Future<void> doBackToLogin() async {
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

  void _createPinHandler(String pin) {
    setState(() {
      _isLoading = true;
    });
    ref.read(pinCreationGenControllerProvider.notifier).createPin(pin);
  }
}
