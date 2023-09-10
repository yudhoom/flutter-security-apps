import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/domain/repositories/auth_repository.dart';

class OtpVerifyController extends StateNotifier<AsyncValue<String?>> {
  AuthRepository authRepository;
  OtpVerifyController({
    required this.authRepository,
  }) : super(const AsyncValue.data(null));

  Future<void> verifyOtp(String username, String otpNumber) async {
    state = const AsyncValue.loading();
    final resp = await authRepository.otpVerify(username, otpNumber);
    state = resp.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}

final otpVerifyProvider = StateNotifierProvider<OtpVerifyController, AsyncValue<String?>>(
  (ref) {
    return OtpVerifyController(
      authRepository: ref.read(authRepositoryProvider),
    );
  },
);
