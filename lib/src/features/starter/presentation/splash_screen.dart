// ignore_for_file: use_build_context_synchronously, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../common_config/palette.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../auth/presentation/login_myjapfa/login_screen.dart';
import '../../home/presentation/home_screen.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = 'splashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  void checkToken() async {
    final activatedStatus = await UserSharedPreferences.getActivate();
    if (activatedStatus == '1') {
      context.goNamed(HomeScreen.routeName);
    } else {
      context.goNamed(LoginScreen.routeName);
    }
    // UserSecureStorage.getAccessToken().then((yourToken) {
    //   if (yourToken != null && yourToken.length > 0) {
    //     bool hasExpired = JwtDecoder.isExpired(yourToken);
    //     if (!hasExpired) {
    //       checkActivation();
    //     } else {
    //       context.goNamed(LoginScreen.routeName);
    //     }
    //   } else {
    //     context.goNamed(LoginScreen.routeName);
    //   }
    // });
  }

  Future<void> checkActivation() async {
    await Future.delayed(const Duration(milliseconds: 10000));
    final activatedStatus = await UserSharedPreferences.getActivate();
    if (activatedStatus == '1') {
      context.goNamed(HomeScreen.routeName);
    } else {
      context.goNamed(LoginScreen.routeName);
    }
  }

  void checkAuth() async {
    context.goNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/splash_bg.png",
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
              Positioned(
                top: 55.0.sp,
                left: 0.0.sp,
                right: 0.0.sp,
                bottom: 0.0.sp,
                child: Center(
                  child: SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Palette.jpopsDarkPrimary,
                      strokeWidth: 7.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Palette.jpopsPrimary.shade700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
