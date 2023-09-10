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
import 'login_myjapfa/login_screen.dart';
import 'pin_input_confirm_screen.dart';
import 'weak_pin_controller.dart';

class PinInputScreen extends StatefulHookConsumerWidget {
  const PinInputScreen({Key? key}) : super(key: key);
  static const routeName = 'pin-input-screen';

  @override
  PinInputScreenState createState() => PinInputScreenState();
}

class PinInputScreenState extends ConsumerState<PinInputScreen> {
  final _pinInputController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final themeContext = Theme.of(context);

    ref.listen<AsyncValue<String?>>(
      weakPinControllerProvider,
      (prviouse, state) {
        if ((!state.isRefreshing && !state.isLoading) && !state.hasError) {
          _pinInputController.clear();
          _pinInputController.text = '';
          context.pushNamed(PinInputConfirmScreen.routeName);
          setState(() {
            isLoading = false;
          });
        }

        if ((!state.isRefreshing && !state.isLoading) && state.hasError) {
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
          setState(() {
            isLoading = false;
          });
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
              icon: const Icon(
                Icons.arrow_back,
              ),
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
            children: <Widget>[
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0.sp),
                    child: SvgPicture.asset('assets/icons/step2.svg'),
                  )),
              Expanded(
                flex: 0,
                child: Image.asset('assets/images/japfa_logo1.png'),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Text(
                    'Masukkan PIN Baru Anda',
                    style: themeContext.textTheme.bodyText1,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : TextField(
                        readOnly: true,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _pinInputController,
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
              Expanded(
                flex: 4,
                child: KeyPadWidget(
                  isPinLogin: false,
                  pinController: _pinInputController,
                  onChange: (String pin) {
                    _pinInputController.text = pin;
                    if (_pinInputController.text.length == 4) {
                      setState(() {
                        isLoading = true;
                      });
                      ref.read(pinInputProvider.notifier).state = _pinInputController.text.trim();
                      ref.read(weakPinControllerProvider.notifier).verifyWeakPin(_pinInputController.text.trim());
                      _pinInputController.clear();
                    }
                    setState(() {});
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

  Future<void> _doBackToLogin() async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text(Constants.BACK_TO_LOGIN),
        actions: [
          CancelButton(label: 'Tidak', dialogContext: dialogContext),
          OkButton(
              dialogContext: dialogContext,
              label: 'Ya',
              someFunction: () {
                context.goNamed(LoginScreen.routeName);
              }),
        ],
      ),
    );
  }
}
