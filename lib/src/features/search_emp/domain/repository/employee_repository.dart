import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../../goshow/domain/entities/direct_spv.dart';
import '../../data/repository/employee_repository_impl.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<DirectSpv>?>> findEmpByKeyword(String tokenDevice);
}

final employeeRepositoryProvider = Provider<EmployeeRepository>(
  (ref) => EmployeeRepositoryImpl(),
);
