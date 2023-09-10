// ignore_for_file: prefer_collection_literals

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../daftar_pengunjung/data/entrant.dart';
import '../../search_emp/domain/repository/employee_repository.dart';
import '../domain/entities/direct_spv.dart';

part 'search_controller.g.dart';

class EntrantController extends StateNotifier<List<Entrant>?> {
  EntrantController() : super(null);
  void addParticipan(Entrant participanToAdd) {
    state = [...?state, participanToAdd].toSet().toList();
  }

  void addSingle(Entrant participanToAdd) {
    state = {participanToAdd}.toList();
  }

  void removeParticipant(Entrant participanToRemove) {
    var myIndex = state?.indexWhere(
      (participant) => participant == participanToRemove,
    );
    if (myIndex != null) {
      state?.removeAt(myIndex);
    }
  }

  isExist(DirectSpv suggestion) {
    return state?.any((participant) => participant.username == suggestion.empname);
  }
}

final entrantControllerProvider = StateNotifierProvider<EntrantController, List<Entrant>?>(
  (ref) => EntrantController(),
);

@riverpod
class SearchEmpByKeywordGenController extends _$SearchEmpByKeywordGenController {
  @override
  FutureOr<List<DirectSpv>?> build() async {
    return null;
  }

  @override
  Future<void> findEmpByKeyword(String keyword) async {
    final repo = ref.read(employeeRepositoryProvider);
    state = const AsyncLoading();
    final result = await repo.findEmpByKeyword(keyword);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

class SearchEmpByKeywordController extends StateNotifier<AsyncValue<List<DirectSpv>?>> {
  final EmployeeRepository repository;
  SearchEmpByKeywordController({
    required this.repository,
  }) : super(const AsyncValue.data(null));

  Future<void> findEmpByKeyword(String keyword) async {
    state = const AsyncLoading();
    final result = await repository.findEmpByKeyword(keyword);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

final searchEmpByKeywordControllerProvider =
    StateNotifierProvider.autoDispose<SearchEmpByKeywordController, AsyncValue<List<DirectSpv>?>>(
  (ref) {
    return SearchEmpByKeywordController(
      repository: ref.watch(employeeRepositoryProvider),
    );
  },
);
