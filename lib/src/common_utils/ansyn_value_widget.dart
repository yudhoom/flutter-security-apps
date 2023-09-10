import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_widgets/text_heading5.dart';
import '../core/client/failure.dart';
import '../core/domain/user_shared_preferences.dart';
import '../features/auth/presentation/login_myjapfa/login_screen.dart';

class AsyncValueWidget<T> extends HookConsumerWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingWidget;
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: data,
      error: (e, st) {
        // Logger().w((e as GeneralFailure).message.toString());
        // Logger().w((e as GeneralFailure).code.toString());
        // Logger().w((e as GeneralFailure).type.toString());
        // ref.watch(signOutProvider(Household(context, (e as GeneralFailure).code ?? 0, e.type)).notifier);
        return Scaffold(
          body: Center(
            child: InkWell(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FeatherIcons.alertTriangle, size: 24.0.sp, color: Colors.red),
                    if ((e as GeneralFailure).type == DioErrorType.other)
                      InkWell(
                        onTap: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: TextHeading5(
                                title: 'Session Expired',
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          await UserSharedPreferences.setActivate('0');
                          context.goNamed(LoginScreen.routeName);
                        },
                        child: const TextHeading5(
                          title: 'Maaf, session anda telah berakhir, silahkan login kembali, klik pesan ini untuk login',
                          centerTitle: true,
                        ),
                      )
                    else
                      TextHeading5(title: (e).message ?? e.toString(), color: Colors.red.shade900, centerTitle: true),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      loading: () {
        return loadingWidget == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextHeading5(title: 'Memuat data...', color: Colors.black),
                    SizedBox(height: 10.0.sp),
                    const CircularProgressIndicator.adaptive(),
                  ],
                ),
              )
            : loadingWidget ?? Container();
      },
    );
  }
}
