import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/domain/user_shared_preferences.dart';
import '../domain/repositories/auth_repository.dart';

final pinInputProvider = StateProvider<String>((ref) => '');

class WeakPinController extends StateNotifier<AsyncValue<String?>> {
  AuthRepository repository;
  WeakPinController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> verifyWeakPin(String pin) async {
    final username = await UserSharedPreferences.getUsername();
    state = const AsyncValue.loading();
    final result = await repository.verifyWeakPin(username ?? '', pin);
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final weakPinControllerProvider = StateNotifierProvider<WeakPinController, AsyncValue<String?>>(
  (ref) => WeakPinController(
    repository: ref.read(authRepositoryProvider),
  ),
);
