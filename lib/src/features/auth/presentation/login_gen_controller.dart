import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/login.dart';
import '../domain/repositories/auth_repository.dart';

part 'login_gen_controller.g.dart';

@riverpod
class LoginGenController extends _$LoginGenController {
  @override
  FutureOr<Login?> build() => null;

  Future<void> authLogin(String username) async {
    final repository = ref.read(authRepositoryProvider);
    final resp = await repository.authLogin(username);
    state = await resp.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}
