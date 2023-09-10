import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/domain/entity/visitor_counter.dart';
import '../../home/domain/entity/visitor_total.dart';
import '../../home/domain/repository/visitor_repository.dart';

part 'visitor_controller.g.dart';

class VisitorCounterController extends StateNotifier<AsyncValue<VisitorCounter?>> {
  VisitorRepository repository;

  VisitorCounterController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getVisitorCounter();
  }

  Future<void> getVisitorCounter() async {
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorCounter();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final visitorLegacyCounterControllerProvider =
    StateNotifierProvider.autoDispose<VisitorCounterController, AsyncValue<VisitorCounter?>>(
  (ref) {
    return VisitorCounterController(
      repository: ref.watch(visitorRepositoryProvider),
    );
  },
);

@riverpod
class VisitorRealizationGenController extends _$VisitorRealizationGenController {
  @override
  FutureOr<VisitorTotal?> build() async {
    final repo = ref.watch(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repo.getVisitorRealization();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return state.value;
  }
}

class VisitorRealizationController extends StateNotifier<AsyncValue<VisitorTotal?>> {
  VisitorRepository repository;

  VisitorRealizationController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getVisitorRealization();
  }

  Future<void> getVisitorRealization() async {
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorRealization();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final visitorRealizationControllerProvider =
    StateNotifierProvider.autoDispose<VisitorRealizationController, AsyncValue<VisitorTotal?>>(
  (ref) {
    return VisitorRealizationController(
      repository: ref.watch(visitorRepositoryProvider),
    );
  },
);

class VisitorVipController extends StateNotifier<AsyncValue<VisitorTotal?>> {
  VisitorRepository repository;

  VisitorVipController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getVisitorVip();
  }

  Future<void> getVisitorVip() async {
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorVip();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

@riverpod
class VisitorVipGenController extends _$VisitorVipGenController {
  @override
  FutureOr<VisitorTotal?> build() async {
    final repo = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repo.getVisitorVip();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return state.value;
  }

  // Future<void> getVisitorVip() async {
  //   state = const AsyncValue.loading();
  //   final resp = await repository.getVisitorVip();
  //   state = await resp.fold(
  //     (l) => AsyncValue.error(l, StackTrace.current),
  //     (r) => AsyncValue.data(r),
  //   );
  // }
}

final visitorVipControllerProvider = StateNotifierProvider.autoDispose<VisitorVipController, AsyncValue<VisitorTotal?>>(
  (ref) {
    return VisitorVipController(
      repository: ref.watch(visitorRepositoryProvider),
    );
  },
);

class VisitorGuestController extends StateNotifier<AsyncValue<VisitorTotal?>> {
  VisitorRepository repository;

  VisitorGuestController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getVisitorGuest();
  }

  Future<void> getVisitorGuest() async {
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorGuest();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final visitorGuestControllerProvider = StateNotifierProvider.autoDispose<VisitorGuestController, AsyncValue<VisitorTotal?>>(
  (ref) {
    return VisitorGuestController(
      repository: ref.watch(visitorRepositoryProvider),
    );
  },
);

@riverpod
class VisitorRegularGenController extends _$VisitorRegularGenController {
  @override
  FutureOr<VisitorTotal?> build() async {
    final repo = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repo.getVisitorRegular();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return state.value;
  }
}

class VisitorRegularController extends StateNotifier<AsyncValue<VisitorTotal?>> {
  VisitorRepository repository;

  VisitorRegularController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getVisitorRegular();
  }

  Future<void> getVisitorRegular() async {
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorRegular();
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final visitorRegularControllerProvider =
    StateNotifierProvider.autoDispose<VisitorRegularController, AsyncValue<VisitorTotal?>>(
  (ref) {
    return VisitorRegularController(
      repository: ref.watch(visitorRepositoryProvider),
    );
  },
);
