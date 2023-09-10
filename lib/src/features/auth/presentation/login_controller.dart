import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/model/login.dart';
import '../domain/repositories/auth_repository.dart';

class LoginAuthController extends StateNotifier<AsyncValue<Login?>> {
  final AuthRepository repository;
  LoginAuthController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> loginAuth(String username) async {
    state = const AsyncValue.loading();
    final result = await repository.login(username);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

final loginControllerProvider = StateNotifierProvider<LoginAuthController, AsyncValue<Login?>>(
  (ref) {
    return LoginAuthController(
      repository: ref.read(authRepositoryProvider),
    );
  },
);
