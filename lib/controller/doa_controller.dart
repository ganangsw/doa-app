import 'package:dartz/dartz.dart';
import 'package:doa_app/model/response_data_doa.dart';
import 'package:get/get.dart';

import '../repository/repository_doa.dart';

class DoaController extends GetxController with StateMixin<List<ResponseDataDoa>> {
  Rx<Either<String, List<ResponseDataDoa>>>? listDoa;

  final RepositoryDoa repositoryDoa = RepositoryDoa();

  @override
  void onInit() {
    getDoa();
    super.onInit();
  }

  Future<void> getDoa() async {
    change(null, status: RxStatus.loading());
    listDoa = (await repositoryDoa.getDoa()).obs;
    listDoa?.value.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (List<ResponseDataDoa> doa) {
        if (doa.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(doa, status: RxStatus.success());
        }
      },
    );
  }
}
