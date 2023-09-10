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
import '../domain/model/jwt_domain.dart';
import 'login_myjapfa/login_screen.dart';
import 'pin_controller.dart';
import 'pin_input_screen.dart';

class PinInputDefaultScreen extends StatefulHookConsumerWidget {
  const PinInputDefaultScreen({Key? key}) : super(key: key);
  static const routeName = 'pin-input-default-screen';

  @override
  PinInputDefaultScreenState createState() => PinInputDefaultScreenState();
}

class PinInputDefaultScreenState extends ConsumerState<PinInputDefaultScreen> {
  final pinInputDefaultController = TextEditingController();
  bool isLoading = false;
  String usernameState = '';

  @override
  void initState() {
    super.initState();
    initSharedPref();
    // TextInputConnection.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final themeContext = Theme.of(context);

    ref.listen<AsyncValue<JwtDomain?>>(
      validateDefaultPinGenControllerProvider,
      (prviouse, state) {
        if (state is AsyncData) {
          pinInputDefaultController.clear();
          pinInputDefaultController.text = '';
          context.goNamed(PinInputScreen.routeName);
          setState(() {
            isLoading = false;
          });
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
                    child: SvgPicture.asset('assets/icons/step1.svg'),
                  )),
              Expanded(flex: 0, child: Image.asset('assets/images/japfa_logo1.png')),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Text(
                    'Masukkan Default PIN',
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
                    : InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: TextField(
                          readOnly: true,
                          autofocus: false,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: pinInputDefaultController,
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
                    pinInputDefaultController.text = pin;
                    if (pinInputDefaultController.text.length == 4) {
                      setState(() {
                        isLoading = true;
                      });
                      ref
                          .read(validateDefaultPinGenControllerProvider.notifier)
                          .validateDefaultPin(pinInputDefaultController.text.trim().toLowerCase());
                      pinInputDefaultController.clear();
                    }
                  },
                  onSubmit: () {},
                  pinController: pinInputDefaultController,
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

  void initSharedPref() async {
    final x = await UserSharedPreferences.getUsername();
    setState(() {
      usernameState = x;
    });
  }
}
