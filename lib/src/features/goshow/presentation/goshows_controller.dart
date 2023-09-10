import 'dart:io';

import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/entities/gate_in_input_karyawan.dart';
import '../domain/entities/gate_in_input_tamu.dart';
import '../domain/entities/gate_in_karyawan_tamu.dart';
import '../domain/entities/image_tmp.dart';
import '../domain/repository/goshow_repository.dart';

final captureTmpImageProfile = StateProvider.family<Map<String, dynamic>, int>(
  (ref, jenis) => {
    "imageLocation": '',
    "imageProfileUrl": '',
    "type": jenis,
  },
);

class GoshowsController extends StateNotifier<AsyncValue<GateInKaryawanTamu?>> {
  GoshowRepository repository;
  GoshowsController({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<void> gateInOtsEmployee(GateInInputKaryawan gateInInputKaryawan) async {
    state = const AsyncLoading();
    final result = await repository.gateInOtsEmployee(gateInInputKaryawan);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }

  Future<void> gateInOtsTamu(GateInInputTamu gateInInputTamu) async {
    state = const AsyncLoading();
    final result = await repository.gateInOtsTamu(gateInInputTamu);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
  }
}

final goshowsControllerProvider = StateNotifierProvider<GoshowsController, AsyncValue<GateInKaryawanTamu?>>(
  (ref) {
    return GoshowsController(
      repository: ref.read(goshowRepositoryProvider),
    );
  },
);

class UploadImageTmpProfile extends StateNotifier<AsyncValue<ImageTmp?>> {
  GoshowRepository repository;
  UploadImageTmpProfile({
    required this.repository,
  }) : super(const AsyncValue.loading());

  Future<ImageTmp?> uploadTmpImageProfile(XFile xfile, File file) async {
    state = const AsyncLoading();
    final result = await repository.uploadTmpImageProfile(xfile, file);
    state = await result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => AsyncData(r),
    );
    return state.value;
  }
}

final uploadImageTmpProfileProvider = StateNotifierProvider<UploadImageTmpProfile, AsyncValue<ImageTmp?>>(
  (ref) {
    return UploadImageTmpProfile(
      repository: ref.read(goshowRepositoryProvider),
    );
  },
);
