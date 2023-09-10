import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:jtlc_front/src/features/goshow/domain/entities/gate_in_input_tamu.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../domain/entities/gate_in_input_karyawan.dart';
import '../../domain/entities/gate_in_karyawan_tamu.dart';
import '../../domain/entities/image_tmp.dart';
import '../../domain/repository/goshow_repository.dart';
import '../data_sources/goshow_remote_datasource.dart';

class GoshowRepositoryImpl implements GoshowRepository {
  final remoteDataSource = GoshowRemoteDataSourceImpl();

  @override
  Future<Either<Failure, GateInKaryawanTamu?>> gateInOtsEmployee(GateInInputKaryawan gateInInputKaryawan) async {
    final resp = await remoteProcess(
      remoteDataSource.gateInOtsEmployee(gateInInputKaryawan),
    );
    return resp.fold(
      (failure) => Left(failure),
      (login) => Right(login.data),
    );
  }

  @override
  Future<Either<Failure, GateInKaryawanTamu?>> gateInOtsTamu(GateInInputTamu gateInInputTamu) async {
    final resp = await remoteProcess(
      remoteDataSource.gateInOtsTamu(gateInInputTamu),
    );
    return resp.fold(
      (failure) => Left(failure),
      (login) => Right(login.data),
    );
  }

  @override
  Future<Either<Failure, ImageTmp?>> uploadTmpImageProfile(XFile xfile, File file) async {
    final resp = await remoteProcess(
      remoteDataSource.uploadTmpImageProfile(xfile, file),
    );
    return resp.fold(
      (failure) => Left(failure),
      (login) => Right(login.data),
    );
  }
}
