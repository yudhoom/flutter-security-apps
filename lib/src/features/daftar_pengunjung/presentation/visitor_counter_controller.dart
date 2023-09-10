import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/domain/entity/visitor_counter.dart';
import '../../home/domain/repository/visitor_repository.dart';

part 'visitor_counter_controller.g.dart';

@riverpod
class VisitorCounterController extends _$VisitorCounterController {
  @override
  FutureOr<VisitorCounter?> build() async {
    final repository = ref.read(visitorRepositoryProvider);
    // state = const AsyncValue.loading();
    final resp = await repository.getVisitorCounter();
    state = await resp.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
    return state.value;
  }

  // @override
  // FutureOr<VisitorTotal?> build() async {
  //   final repository = ref.read(visitorRepositoryProvider);
  //   final result = await repository.getVisitorGuest();
  //   state = await result.fold(
  //     (l) => AsyncError(l, StackTrace.current),
  //     (r) => AsyncData(r),
  //   );
  // }

  Future<void> getVisitorCounter() async {
    final repository = ref.read(visitorRepositoryProvider);
    // state = const AsyncValue.loading();
    final resp = await repository.getVisitorCounter();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}
