import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/model/login.dart';
import '../domain/repositories/auth_repository.dart';

class AuthLoginController extends StateNotifier<AsyncValue<Login?>> {
  AuthRepository repository;
  AuthLoginController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> authLogin(String username) async {
    state = const AsyncValue.loading();
    final result = await repository.authLogin(username);
    state = await result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final authLoginControllerProvider = StateNotifierProvider.autoDispose<AuthLoginController, AsyncValue<Login?>>(
  (ref) => AuthLoginController(
    repository: ref.read(authRepositoryProvider),
  ),
);
