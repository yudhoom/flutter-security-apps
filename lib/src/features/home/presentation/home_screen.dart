// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/ansyn_value_widget.dart';
import '../../../common_utils/utils.dart';
import '../../../common_widgets/text_heading5.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../common_widgets/text_heading7.dart';
import '../../../core/domain/entities/counter.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../../core/services/dashboard_service.dart';
import '../../auth/presentation/login_myjapfa/login_screen.dart';
import '../../chats/presentation/chats_screen.dart';
import '../../daftar_pengunjung/presentation/pengunjung_aktual_screen.dart';
import '../../daftar_pengunjung/presentation/pengunjung_hari_ini_screen.dart';
import '../../daftar_pengunjung/presentation/pengunjung_regular_screen.dart';
import '../../daftar_pengunjung/presentation/pengunjung_vip_screen.dart';
import '../../daftar_pengunjung/presentation/visitor_counter_controller.dart';
import '../domain/entity/visitor_counter.dart';
import 'widgets/access_item_widget.dart';
import 'widgets/getein_geteout_widget.dart';
import 'widgets/karyawan_tamu_button_widget.dart';
import 'widgets/passenger_resume_widget.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'homeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  var realNameState = '';
  var imageProfileState = '';

  @override
  void initState() {
    super.initState();
    initProfile();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardSteamState = ref.watch(dashboardStreamProvider);
    final x = ref.watch(visitorCounterControllerProvider);
    // final x = ref.watch(visitorLegacyCounterControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        doExit(context);
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppThemeJtlc.jtlcGray,
            toolbarHeight: MediaQuery.of(context).size.height * 0.070,
            centerTitle: false,
            elevation: 0.0.sp,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: CircleAvatar(
                    radius: 20.5.sp,
                    backgroundImage: NetworkImage(imageProfileState),
                    backgroundColor: AppThemeJtlc.jtlcMute,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const TextHeading7(title: 'Selamat Datang, '),
                            SizedBox(
                              width: 125.0.sp,
                              child: TextHeading6(
                                title: realNameState,
                                color: AppThemeJtlc.jtlcOrange,
                                isBold: true,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5.sp),
                          child: TextHeading7(
                            title: simpleDateTimeFormat(DateTime.now().toString()),
                            color: AppThemeJtlc.jtlcGrayMute,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  FeatherIcons.logOut,
                  color: AppThemeJtlc.jtlcOrange,
                ),
                onPressed: () async {
                  doConfirmLogout(context);
                },
              ),
            ],
          ),
          body: AsyncValueWidget<Counter?>(
            value: dashboardSteamState,
            data: (dataku) {
              int jtlcEmployee = dataku?.jtlcEmployee ?? 0;
              int jtlcExternal = dataku?.jtlcExternal ?? 0;
              int jtlcInternal = dataku?.jtlcInternal ?? 0;
              int jtlcGuest = dataku?.jtlcGuest ?? 0;
              int jtlcVip = dataku?.jtlcVip ?? 0;
              var totalOrangDiKawasanJtlc = jtlcEmployee + jtlcExternal + jtlcInternal + jtlcGuest + jtlcVip;

              return Column(children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 0.0.sp, vertical: 0.0.sp),
                    child: Card(
                      elevation: 0.0.sp,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.0.sp, vertical: 5.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 0.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(FeatherIcons.users),
                                          SizedBox(width: 10.0.sp),
                                          // TextHeading2(
                                          //   title: '$totalOrangDiKawasanJtlc',
                                          //   fontSize: 28.0.sp,
                                          //   color: AppThemeJtlc.jtlcOrange,
                                          // ),
                                          AnimatedFlipCounter(
                                            duration: const Duration(milliseconds: 500),
                                            value: totalOrangDiKawasanJtlc,
                                            fractionDigits: 0, // decimal precision
                                            textStyle: TextStyle(
                                              fontSize: 35.0.sp,
                                              color: AppThemeJtlc.jtlcOrange,
                                              fontWeight: FontWeight.bold,
                                              // color: total >= 0 ? Colors.green : Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          TextHeading5(title: 'Total Orang di Kawasan JTLC'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 0.0.sp),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PassengerResumeWidget(
                                      title: 'Karyawan',
                                      total: jtlcEmployee,
                                      backgroundColor: AppThemeJtlc.jtlcOrange,
                                      totalColor: AppThemeJtlc.white,
                                      titleColor: AppThemeJtlc.white,
                                    ),
                                    PassengerResumeWidget(
                                      title: 'Tamu',
                                      total: jtlcGuest,
                                      backgroundColor: AppThemeJtlc.jtlcGreenLeaf,
                                      totalColor: AppThemeJtlc.white,
                                      titleColor: AppThemeJtlc.white,
                                    ),
                                    PassengerResumeWidget(
                                      title: 'VIP',
                                      total: jtlcVip,
                                      backgroundColor: AppThemeJtlc.jtlcBlackVip,
                                      totalColor: AppThemeJtlc.white,
                                      titleColor: AppThemeJtlc.white,
                                    ),
                                    PassengerResumeWidget(
                                      title: 'Internal\nJTLC',
                                      total: jtlcInternal,
                                      backgroundColor: AppThemeJtlc.jtlcYellow,
                                      totalColor: AppThemeJtlc.jtlcTitleBlack,
                                      titleColor: AppThemeJtlc.jtlcTitleBlack,
                                    ),
                                    PassengerResumeWidget(
                                      title: 'External\nJTLC',
                                      total: jtlcExternal,
                                      backgroundColor: AppThemeJtlc.jtlcPurple,
                                      titleColor: AppThemeJtlc.white,
                                      totalColor: AppThemeJtlc.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 0, child: GateinGateoutWidget()),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 20.5.sp),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: AsyncValueWidget<VisitorCounter?>(
                      value: x,
                      data: (dataku) {
                        var expectedGuest = dataku?.expectedGuest ?? 0;
                        var expectedVip = dataku?.expectedVip ?? 0;
                        var expectedRegular = dataku?.expectedRegular ?? 0;
                        var realVisitor = dataku?.realVisitor ?? 0;

                        return RefreshIndicator(
                          onRefresh: () async {
                            // ref.refresh(visitorLegacyCounterControllerProvider);
                            ref.refresh(visitorCounterControllerProvider);
                          },
                          child: ListView(
                            // physics: const BouncingScrollPhysics(),
                            physics: const AlwaysScrollableScrollPhysics(),
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextHeading5(title: 'Pendaftaran Pengunjung di Lokasi JTLC', isBold: true),
                              SizedBox(height: 5.0.sp),
                              const KaryawanTamuButtonWidget(),
                              const TextHeading5(title: 'Daftar Akses Pengunjung JTLC', isBold: true),
                              SizedBox(height: 5.0.sp),
                              CardAccessItemWidget(
                                title: 'Karyawan + Tamu', //akses regular
                                image: 'assets/icons/visiting_icon.png',
                                total: expectedGuest,
                                onTap: () => context.pushNamed(PengunjungHariIniScreen.routeName, extra: '1'),
                              ),
                              SizedBox(height: 5.0.sp),
                              CardAccessItemWidget(
                                title: 'VIP',
                                image: 'assets/icons/vip_card.png',
                                total: expectedVip,
                                onTap: () => context.pushNamed(PengunjungVipScreen.routeName, extra: '2'),
                              ),
                              SizedBox(height: 5.0.sp),
                              CardAccessItemWidget(
                                title: 'Internal + Eksternal JTLC', //regular
                                image: 'assets/icons/id_card.png',
                                total: expectedRegular,
                                onTap: () => context.pushNamed(PengunjungRegularScreen.routeName, extra: '3'),
                              ),
                              SizedBox(height: 10.0.sp),
                              const TextHeading5(title: 'Realisasi Pengunjung JTLC', isBold: true),
                              SizedBox(height: 10.0.sp),
                              CardAccessItemWidget(
                                color: AppThemeJtlc.jtlcBlueTeal,
                                title: 'Pengunjung Aktual',
                                image: 'assets/icons/realization.png',
                                total: realVisitor,
                                onTap: () => context.pushNamed(PengunjungAktualScreen.routeName, extra: '4'),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }

  void handleClick(BuildContext context, String value) {
    switch (value) {
      case 'Logout':
        context.goNamed(LoginScreen.routeName);
        break;
      case 'Settings':
        break;
      case 'Chat':
        context.pushNamed(ChatScreen.routeName);
        break;
    }
  }

  void doExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void doConfirmLogout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Konfirmasi'),
              content: const Text('Apakah anda yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tidak'),
                ),
                TextButton(
                  onPressed: () async {
                    await UserSharedPreferences.setActivate('0');
                    context.goNamed(LoginScreen.routeName);
                  },
                  child: const Text('Ya'),
                ),
              ],
            ));
  }

  void initProfile() async {
    final realName = await UserSharedPreferences.getName();
    final imageProfile = await UserSharedPreferences.getImageUrlAfterUpload();
    setState(() {
      realNameState = realName ?? '';
      imageProfileState = imageProfile ?? '';
    });
  }
}
