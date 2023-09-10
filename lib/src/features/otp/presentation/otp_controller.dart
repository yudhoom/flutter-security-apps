import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/domain/repositories/auth_repository.dart';
import '../domain/entities/otp.dart';

class OtpController extends StateNotifier<AsyncValue<Otp?>> {
  AuthRepository repository;
  OtpController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> otpGenerate(String username, String type, String contact) async {
    state = const AsyncValue.loading();
    final result = await repository.otpGenerate(username, type, contact);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

final otpControllerProvider = StateNotifierProvider<OtpController, AsyncValue<Otp?>>(
  (ref) => OtpController(
    repository: ref.read(authRepositoryProvider),
  ),
);

class OtpItemNotifier extends StateNotifier<Map<String, String>> {
  OtpItemNotifier() : super({});
  void setOtp(Map<String, String> otpItem) {
    state = otpItem;
  }
}

final otpItemProvider = StateNotifierProvider<OtpItemNotifier, Map<String, String>>(
  (ref) => OtpItemNotifier(),
);
