import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/domain/entity/visitor_total.dart';
import '../../home/domain/repository/visitor_repository.dart';

part 'pengunjung_hari_ini_controller.g.dart';

@riverpod
class PengunjungHariIniController extends _$PengunjungHariIniController {
  @override
  FutureOr<VisitorTotal?> build() async {
    final repository = ref.read(visitorRepositoryProvider);
    final result = await repository.getVisitorGuest();
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}
