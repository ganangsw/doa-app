import 'package:doa_app/controller/doa_controller.dart';
import 'package:doa_app/page/cari_doa_page.dart';
import 'package:doa_app/page/component/data_item_doa.dart';
import 'package:doa_app/widget/empty_widget.dart';
import 'package:doa_app/widget/retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../model/response_data_doa.dart';

class ListDoaPage extends StatelessWidget {
  ListDoaPage({super.key});

  final controller = Get.put(DoaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Do'a Sehari-hari",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CariDoaPage());
              },
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: controller.obx(
          (state) => ListView.builder(
            shrinkWrap: true,
            itemCount: state?.length,
            itemBuilder: (_, index) {
              ResponseDataDoa? doa = state?[index];
              return DataItemDoa(doa!);
            },
          ),
          onLoading: const SpinKitCircle(
            color: Colors.green,
          ),
          onError: (error) => RetryWidget(
            message: "$error",
            onRetryPressed: () => controller.getDoa(),
          ),
          onEmpty: const EmptyWidget(message: 'Tidak ada doa!'),
        ),
      ),
    );
  }
}
