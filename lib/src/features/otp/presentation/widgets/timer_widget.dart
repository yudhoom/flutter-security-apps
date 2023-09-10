// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_config/app_theme_jtlc.dart';
import '../../../../common_widgets/text_heading5.dart';
import '../timer_controller.dart';

class TimerWidget extends StatefulHookConsumerWidget {
  final Function? doKirimUlangOtp;
  final String? isBack;
  const TimerWidget({
    Key? key,
    this.isBack,
    this.doKirimUlangOtp,
  }) : super(key: key);
  static const defaultCounterNumber = 60;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  int counter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    initCounter();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return counter == 0
        ? TextButton(
            onPressed: () {
              widget.doKirimUlangOtp?.call();
              setState(() {
                counter = TimerWidget.defaultCounterNumber;
              });
              initCounter();
            },
            child: const TextHeading5(
              title: 'Kirim Ulang OTP',
              color: AppThemeJtlc.jtlcBlueDark,
            ),
          )
        : TextButton(
            onPressed: null,
            child: TextHeading5(
              title: 'Kirim ulang OTP | $counter detik',
            ),
          );
  }

  doCounterDown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (counter == 0) {
          timer.cancel();
          ref.read(counterNumberProvider.notifier).state = counter;
        } else {
          setState(() {
            counter--;
          });
          ref.read(counterNumberProvider.notifier).state--;
        }
      },
    );
  }

  void onTimeZero(BuildContext context, Timer timer) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Time up'),
            content: Text('Please resend'),
          );
        });
  }

  void initCounter() {
    if (widget.isBack == 'back' && counter == 0) {
      setState(() {
        counter = 0;
      });
    } else {
      setState(() {
        counter = TimerWidget.defaultCounterNumber;
      });
    }
    doCounterDown();
  }
}
