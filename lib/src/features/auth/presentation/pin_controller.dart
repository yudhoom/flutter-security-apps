import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/user_shared_preferences.dart';
import '../domain/model/jwt_domain.dart';
import '../domain/repositories/auth_repository.dart';

part 'pin_controller.g.dart';

@riverpod
class PinCreationGenController extends _$PinCreationGenController {
  @override
  FutureOr<JwtDomain?> build() => null;

  Future<void> createPin(String pin) async {
    final repository = ref.read(authRepositoryProvider);
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.createPin(username ?? '', pin);
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

// class PinCreationController extends StateNotifier<AsyncValue<JwtDomain?>> {
//   AuthRepository repository;
//   PinCreationController({
//     required this.repository,
//   }) : super(const AsyncValue.loading());

//   Future<void> createPin(String pin) async {
//     final username = await UserSharedPreferences.getUsername();
//     state = const AsyncValue.loading();
//     final result = await repository.createPin(username ?? '', pin);
//     state = await result.fold(
//       (l) => AsyncValue.error(l, StackTrace.current),
//       (r) => AsyncValue.data(r),
//     );
//   }
// }

// final pinManageProvider = StateNotifierProvider.autoDispose<PinCreationController, AsyncValue<JwtDomain?>>(
//   (ref) {
//     return PinCreationController(
//       repository: ref.watch(authRepositoryProvider),
//     );
//   },
// );

class PinVerifyController extends StateNotifier<AsyncValue<JwtDomain?>> {
  AuthRepository repository;

  PinVerifyController({
    required this.repository,
  }) : super(const AsyncValue.data(null));

  Future<void> verifyPin(String? pin) async {
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.verifyPin(username ?? '', pin ?? '');
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final pinVerifyProvider = StateNotifierProvider.autoDispose<PinVerifyController, AsyncValue<JwtDomain?>>(
  (ref) {
    return PinVerifyController(
      repository: ref.watch(authRepositoryProvider),
    );
  },
);

class ForgotPinController extends StateNotifier<AsyncValue<String?>> {
  AuthRepository repository;
  ForgotPinController({
    required this.repository,
  }) : super(const AsyncValue.data(null));

  Future<void> forgotPin() async {
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.forgotPin(username ?? '');
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final forgotPinProvider = StateNotifierProvider.autoDispose<ForgotPinController, AsyncValue<String?>>(
  (ref) {
    return ForgotPinController(
      repository: ref.watch(authRepositoryProvider),
    );
  },
);

class ValidateOldPinController extends StateNotifier<AsyncValue<String?>> {
  AuthRepository repository;
  ValidateOldPinController({
    required this.repository,
  }) : super(const AsyncValue.data(null));

  Future<void> validateOldPin(String pin) async {
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.validateOldPin(username ?? '', pin);
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final validateOldPinProvider = StateNotifierProvider.autoDispose<ValidateOldPinController, AsyncValue<String?>>(
  (ref) {
    return ValidateOldPinController(
      repository: ref.watch(authRepositoryProvider),
    );
  },
);

class ChangePinController extends StateNotifier<AsyncValue<String?>> {
  AuthRepository repository;
  ChangePinController({
    required this.repository,
  }) : super(const AsyncValue.data(null));

  Future<void> changePin(String pin, String pinNew) async {
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.pinChange(username ?? '', pin, pinNew);
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final changePinProvider = StateNotifierProvider.autoDispose<ChangePinController, AsyncValue<String?>>(
  (ref) {
    return ChangePinController(
      repository: ref.watch(authRepositoryProvider),
    );
  },
);

@riverpod
class ValidateDefaultPinGenController extends _$ValidateDefaultPinGenController {
  @override
  FutureOr<JwtDomain?> build() => null;

  Future<void> validateDefaultPin(String? pin) async {
    final repository = ref.read(authRepositoryProvider);
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.validateDefaultPin(username ?? '', pin ?? '');
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

// class ValidateDefaultPinController extends StateNotifier<AsyncValue<JwtDomain?>> {
//   AuthRepository repository;

//   ValidateDefaultPinController({
//     required this.repository,
//   }) : super(const AsyncValue.data(null));

//   Future<void> validateDefaultPin(String? pin) async {
//     final username = await UserSharedPreferences.getUsername();
//     state = const AsyncValue.loading();
//     final result = await repository.validateDefaultPin(username ?? '', pin ?? '');
//     state = await result.fold(
//       (l) => AsyncValue.error(l, StackTrace.current),
//       (r) => AsyncValue.data(r),
//     );
//   }
// }

// final validateDefaultPinProvider = StateNotifierProvider<ValidateDefaultPinController, AsyncValue<JwtDomain?>>(
//   (ref) {
//     return ValidateDefaultPinController(
//       repository: ref.watch(authRepositoryProvider),
//     );
//   },
// );
