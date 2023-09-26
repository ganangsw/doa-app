import 'package:dartz/dartz.dart';
import 'package:doa_app/model/response_data_doa.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/repository_doa.dart';

class CariDoaController extends GetxController
    with StateMixin<ResponseDataDoa> {
  Rx<Either<String, ResponseDataDoa>>? doa;

  final RepositoryDoa repositoryDoa = RepositoryDoa();
  final cariController = TextEditingController().obs;
  var firstLoad = true.obs;

  @override
  void onClose() {
    super.onClose();
    cariController.value.dispose();
  }

  Future<void> getCariDoa() async {
    firstLoad.value = false;
    change(null, status: RxStatus.loading());
    var query = cariController.value.text
        .replaceAll(' ', '%20')
        .replaceAll('doa', '')
        .replaceAll('Doa', '');
    doa = (await repositoryDoa.getCariDoa(query: query)).obs;
    doa?.value.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (ResponseDataDoa data) {
        if (data == null) {
          change(null, status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      },
    );
  }
}
