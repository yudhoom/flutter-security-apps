import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/model/visitor_gate.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/repository/qr_event_repository.dart';

import '../data/model/qr_event_model.dart';
import '../domain/model/bulk_gate.dart';
import '../domain/model/qr_event.dart';

class ScanQrController extends StateNotifier<AsyncValue<QrEventModel?>> {
  final QREventRepository repository;
  ScanQrController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> findEmployee(String qrId, String gate) async {
    state = const AsyncLoading();
    if (qrId.isNotEmpty) {
      final result = await repository.findEmployee(qrId, gate);
      state = await result.fold(
        (l) => AsyncError(l, StackTrace.current),
        (r) => AsyncData(r),
      );
    }
  }
}

final scanQrControllerProvider = StateNotifierProvider.autoDispose<ScanQrController, AsyncValue<QrEventModel?>>(
  (ref) {
    return ScanQrController(
      repository: ref.read(qrEventRepositoryProvider),
    );
  },
);

class BulkGateController extends StateNotifier<AsyncValue<VisitorGate?>> {
  final QREventRepository repository;
  BulkGateController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> bulkGate(BulkGate payload) async {
    state = const AsyncLoading();
    // if (payload.) {
    final result = await repository.bulkGate(payload);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
    // }
  }
}

final bulkGateControllerProvider = StateNotifierProvider<BulkGateController, AsyncValue<VisitorGate?>>(
  (ref) {
    return BulkGateController(
      repository: ref.read(qrEventRepositoryProvider),
    );
  },
);

class BulkGateOutController extends StateNotifier<AsyncValue<VisitorGate?>> {
  final QREventRepository repository;
  BulkGateOutController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> bulkGateOut(BulkGate payload) async {
    state = const AsyncLoading();
    // if (payload.) {
    final result = await repository.bulkGateOut(payload);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
    // }
  }
}

final bulkGateOutControllerProvider = StateNotifierProvider<BulkGateOutController, AsyncValue<VisitorGate?>>(
  (ref) {
    return BulkGateOutController(
      repository: ref.read(qrEventRepositoryProvider),
    );
  },
);

class VisitorListController extends StateNotifier<List<QrEvent?>> {
  VisitorListController() : super([]);

  void addParticipant(QrEvent qrEvent) {
    // state = [...state, qrEvent];
    var myState = [...state];
    var findByIndex = myState.indexWhere((element) => element?.username == qrEvent.username);
    if (findByIndex == -1) {
      myState.add(qrEvent);
    } else {
      myState[findByIndex] = qrEvent;
    }
    state = myState;
  }

  void removeParticipant(QrEvent qrEvent) {
    var myState = [...state];
    var myIndex = myState.indexWhere(
      (participant) => participant == qrEvent,
    );
    myState.removeAt(myIndex);
    state = myState;
  }

  void resetParticipant() {
    state = [];
  }
}

final visitorProvider = StateNotifierProvider<VisitorListController, List<QrEvent?>>(
  (ref) => VisitorListController(),
);

class VisitorBulkController extends StateNotifier<BulkGate> {
  VisitorBulkController({
    required BulkGate items,
  }) : super(BulkGate());

  void add(BulkGate bulkGate) {
    state = bulkGate;
  }

  void updateDriverphoto(String driverPhoto) {
    state = state.copyWith(driverPhoto: driverPhoto);
  }
}

final visitorBulkControllerProvider = StateNotifierProvider<VisitorBulkController, BulkGate>(
  (ref) {
    return VisitorBulkController(
      items: BulkGate(),
    );
  },
);
