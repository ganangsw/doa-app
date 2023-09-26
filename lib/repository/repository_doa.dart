import 'package:dartz/dartz.dart';
import 'package:doa_app/model/response_data_doa.dart';
import 'package:doa_app/network/dio_api_base.dart';

class RepositoryDoa extends DioApiBase<ResponseDataDoa> {
  Future<Either<String, List<ResponseDataDoa>>> getDoa() async {
    return makeGetRequest(dioClient.dio!.get("/api"), ResponseDataDoa.fromJson);
  }

  Future<Either<String, ResponseDataDoa>> getCariDoa({String? query}) async {
    return makeGetRequest2(
        dioClient.dio!.get("/api/doa/$query"), ResponseDataDoa.fromJson);
  }
}
