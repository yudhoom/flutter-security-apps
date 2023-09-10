import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterNumberProvider = StateProvider<int>((ref) => 0);

class TimerController extends StateNotifier<void> {
  int globalTimer;
  TimerController({
    required this.globalTimer,
  }) : super(null);

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (timer) {
        if (globalTimer == 0) {
          timer.cancel();
        } else {
          globalTimer--;
        }
      },
    );
  }
}

final timerControllerProvider = StateNotifierProvider<TimerController, void>(
  (ref) {
    final counterTimer = ref.watch(counterNumberProvider);
    return TimerController(
      globalTimer: counterTimer,
    );
  },
);
