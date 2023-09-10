import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/repository/goshow_repository_impl.dart';
import '../entities/gate_in_input_karyawan.dart';
import '../entities/gate_in_input_tamu.dart';
import '../entities/gate_in_karyawan_tamu.dart';
import '../entities/image_tmp.dart';

abstract class GoshowRepository {
  Future<Either<Failure, GateInKaryawanTamu?>> gateInOtsEmployee(GateInInputKaryawan qrId);
  Future<Either<Failure, GateInKaryawanTamu?>> gateInOtsTamu(GateInInputTamu qrId);
  Future<Either<Failure, ImageTmp?>> uploadTmpImageProfile(XFile xfile, File file);
}

final goshowRepositoryProvider = Provider<GoshowRepository>(
  (ref) => GoshowRepositoryImpl(),
);
