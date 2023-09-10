import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jtlc_front/src/common_config/app_theme_jtlc.dart';

import 'common_config/palette.dart';
import 'common_router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context, child) {
        return MaterialApp.router(
          // return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // English, no country code
            Locale('id', 'ID'), // Indonesia, no country code
          ],
          locale: const Locale('id', 'ID'),
          routerDelegate: goRouter.routerDelegate,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
          title: 'MyJapfa Security Scanner',

          theme: ThemeData(
            dividerColor: Colors.transparent,
            primarySwatch: Palette.jpopsPrimary,
            appBarTheme: const AppBarTheme(
              color: AppThemeJtlc.white,
              foregroundColor: AppThemeJtlc.jtlcHeadingBlack,
              elevation: 2,
            ),
            scaffoldBackgroundColor: AppThemeJtlc.jtlcGray,
            useMaterial3: false,
          ),

          // initialRoute: '/',
          // routes: {
          //   '/': (ctx) {
          //     return const LoginScreen();
          //   }
          // },
        );
      },
    );
  }
}
