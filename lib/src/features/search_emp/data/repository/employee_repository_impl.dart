import 'package:dartz/dartz.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../../goshow/domain/entities/direct_spv.dart';
import '../../domain/repository/employee_repository.dart';
import 'data_source/employee_remote_datasource.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final remoteDataSource = EmployeeRemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<DirectSpv>?>> findEmpByKeyword(String paramKeyword) async {
    final resp = await remoteProcess(
      remoteDataSource.findEmpByKeyword(paramKeyword),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
