// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jtlc_front/src/features/auth/presentation/pin_input_default_screen.dart';
import 'package:jtlc_front/src/features/chats/presentation/chats_screen.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/domain/pengunjung_param.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_aktual_screen.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_hari_ini_screen.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_regular_screen.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/pengunjung_vip_screen.dart';
import 'package:jtlc_front/src/features/daftar_pengunjung/presentation/security_ots_camera_screen.dart';
import 'package:jtlc_front/src/features/goshow/presentation/form_karyawan_hari_ini_screen.dart';
import 'package:jtlc_front/src/features/home2/presentation/home2_screen.dart';
import 'package:jtlc_front/src/features/notification/presentation/notification_screen.dart';
import 'package:jtlc_front/src/features/otp/presentation/otp_options_screen.dart';
import 'package:jtlc_front/src/features/otp/presentation/otp_pin_code_screen.dart';
import 'package:jtlc_front/src/features/qr_scan/presentation/check_in_screen.dart';
import 'package:jtlc_front/src/features/qr_scan/presentation/security_camera_screen.dart';
import 'package:jtlc_front/src/features/qr_scan/presentation/visitor_detail_screen.dart';
import 'package:jtlc_front/src/features/qr_scanner_demo/presentation/qr_scanner_demo_screen.dart';

import '../features/auth/presentation/login_myjapfa/login_screen.dart';
import '../features/auth/presentation/pin_input_confirm_screen.dart';
import '../features/auth/presentation/pin_input_relogin_screen.dart';
import '../features/auth/presentation/pin_input_screen.dart';
import '../features/daftar_pengunjung/presentation/pengunjung_detail_screen.dart';
import '../features/goshow/presentation/form_tamu_hari_ini_screen.dart';
import '../features/goshow/presentation/search_emp_manual_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/qr_scan/presentation/scan_qr_screen_new.dart';
import '../features/starter/presentation/splash_screen.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      path: '/login-screen',
      name: LoginScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/otp-pin-input-screen',
      name: OtpPinCodeScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const OtpPinCodeScreen(),
      ),
    ),
    GoRoute(
      path: '/otp-options-screen',
      name: OtpOptions.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const OtpOptions(),
      ),
    ),
    GoRoute(
      path: '/relogin-screen',
      name: PinInputReloginScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const PinInputReloginScreen(),
      ),
    ),
    GoRoute(
      path: '/pin-input-default-screen',
      name: PinInputDefaultScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const PinInputDefaultScreen(),
      ),
    ),
    GoRoute(
        path: '/pin-input-screen',
        name: PinInputScreen.routeName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const PinInputScreen(),
            ),
        routes: [
          GoRoute(
            path: 'pin-input-screen-confirm',
            name: PinInputConfirmScreen.routeName,
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: PinInputConfirmScreen(),
            ),
          ),
        ]),
    GoRoute(
        path: '/qr-scanner-demo',
        name: QRScannerDemoScreen.routeName,
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const QRScannerDemoScreen(),
            )),
    GoRoute(
      path: '/new-qr-scan',
      name: ScanQrScreenNew.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const ScanQrScreenNew(),
      ),
    ),
    GoRoute(
      path: '/chat-screen',
      name: ChatScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const ChatScreen(),
      ),
    ),
    GoRoute(
      path: '/notifications',
      name: NotificationScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const NotificationScreen(),
      ),
    ),
    GoRoute(
      path: '/check-in-screen',
      name: CheckInScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        // restorationId: state.pageKey.value,
        key: state.pageKey,
        child: const CheckInScreen(),
      ),
    ),
    GoRoute(
      path: '/security-camera',
      name: SecurityCameraScreen.routeName,
      pageBuilder: (context, state) {
        final paramRouteName = state.extra as String?;
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: SecurityCameraScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security-ots-camera-screen',
      name: SecurityOtsCameraScreen.routeName,
      pageBuilder: (context, state) {
        final paramRouteName = state.extra as String?;
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: SecurityOtsCameraScreen(
            paramRouteName: paramRouteName ?? '',
          ),
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
      routes: [
        GoRoute(
          path: 'home-2-screen',
          name: Home2Screen.routeName,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const Home2Screen(),
          ),
        ),
        // GoRoute(
        //   path: 'qr-result',
        //   name: QrResultScreen.routeName,
        //   pageBuilder: (context, state) => NoTransitionPage<void>(
        //     key: state.pageKey,
        //     child: const QrResultScreen(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'results-screen',
        //   name: ResultsScreen.routeName,
        //   pageBuilder: (context, state) => NoTransitionPage<void>(
        //     key: state.pageKey,
        //     child: const ResultsScreen(),
        //   ),
        // ),
        GoRoute(
          path: 'pengunjung-aktual-screen',
          name: PengunjungAktualScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as String?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: PengunjungAktualScreen(
                paramsId: params ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: 'pengunjung-hari-ini-screen',
          name: PengunjungHariIniScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as String?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: PengunjungHariIniScreen(
                paramsId: params ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: 'pengunjung-regular-screen',
          name: PengunjungRegularScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as String?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: PengunjungRegularScreen(
                paramsId: params ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: 'pengunjung-vip-screen',
          name: PengunjungVipScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as String?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: PengunjungVipScreen(
                paramsId: params ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: 'pengunjung-detail-screen',
          name: PengunjungDetailScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as PengunjungParam?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: PengunjungDetailScreen(pengunjungParam: params ?? PengunjungParam()),
            );
          },
        ),
        GoRoute(
          path: 'visitor-detail-screen',
          name: VisitorDetailScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as PengunjungParam?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: VisitorDetailScreen(pengunjungParam: params ?? PengunjungParam()),
            );
          },
        ),
        GoRoute(
          path: 'form-tamu-hari-ini',
          name: FormTamuHariIniScreen.routeName,
          pageBuilder: (context, state) {
            final params = state.extra as String?;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: FormTamuHariIniScreen(),
            );
          },
        ),
        GoRoute(
            path: 'search-emp-manual',
            name: SearchEmpManualScreen.routeName,
            pageBuilder: (context, state) {
              final params = state.extra as String?;
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: SearchEmpManualScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'form-karyawan-hari-ini-screen',
                name: FormKaryawanHariIniScreen.routeName,
                pageBuilder: (context, state) {
                  final params = state.extra as String?;
                  return NoTransitionPage<void>(
                    key: state.pageKey,
                    child: FormKaryawanHariIniScreen(),
                  );
                },
              ),
            ]),
      ],
    ),
  ],
);
