import '../../../../../core/client/dio_client.dart';
import '../../../../../core/client/endpoints.dart';
import '../../model/search_emp_model.dart';

abstract class EmployeeRemoteDataSource {
  Future<SearchEmpModel> findEmpByKeyword(String paramKeywords);
}

//=========================================================================
class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  @override
  Future<SearchEmpModel> findEmpByKeyword(String paramKeywords) async {
    // debugPrint(paramKeywords);
    final resp = await DioClient().apiCall(
      url: Endpoints.findEmpByKeyword,
      requestType: RequestType.post,
      body: {'keyword': paramKeywords},
    );
    return SearchEmpModel.fromJson(resp.data);
  }
}
