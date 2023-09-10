import 'package:jtlc_front/src/features/home/domain/entity/visitor_gate_in_out.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor_input.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/user_shared_preferences.dart';
import '../../home/domain/entity/visitor_detail.dart';
import '../../home/domain/repository/visitor_repository.dart';

part 'visitor_detail_controller.g.dart';

@riverpod
class VisitorDetailController extends _$VisitorDetailController {
  @override
  FutureOr<VisitorDetail?> build(String username, String idEvent, String idManifest) async {
    final repository = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorGuestDetail(username, idEvent, idManifest);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return null;
  }
}

@riverpod
class VisitorDetailVipController extends _$VisitorDetailVipController {
  @override
  FutureOr<VisitorDetail?> build(String username, String idManifest) async {
    final repository = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorVipDetail(username, idManifest);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return null;
  }
}

@riverpod
class VisitorDetailRegularController extends _$VisitorDetailRegularController {
  @override
  FutureOr<VisitorDetail?> build(String username, String idManifest) async {
    final repository = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorRegularDetail(username, idManifest);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return null;
  }
}

@riverpod
class VisitorDetailRealizationController extends _$VisitorDetailRealizationController {
  @override
  FutureOr<VisitorDetail?> build(String username, String idManifest) async {
    final repository = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repository.getVisitorRealizationDetail(username, idManifest);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    return null;
  }
}

@riverpod
class VisitorPostGateInController extends _$VisitorPostGateInController {
  @override
  FutureOr<VisitorGateInOut?> build() async {
    return null;
  }

  Future<void> postGateIn(VisitorInput visitorInput) async {
    final username = await UserSharedPreferences.getUsername();
    final repository = ref.read(visitorRepositoryProvider);

    state = const AsyncValue.loading();
    final resp = await repository.postSingleGateIn(username ?? '', visitorInput);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
    ref.invalidateSelf();
  }
}

@riverpod
class VisitorPutGateOutController extends _$VisitorPutGateOutController {
  @override
  FutureOr<VisitorGateInOut?> build() async {
    return null;
  }

  Future<void> putGateOut(VisitorInput visitorInput) async {
    final username = await UserSharedPreferences.getUsername();
    final repository = ref.read(visitorRepositoryProvider);
    state = const AsyncValue.loading();
    final resp = await repository.putSingleGateOut(username ?? '', visitorInput);
    state = await resp.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}
