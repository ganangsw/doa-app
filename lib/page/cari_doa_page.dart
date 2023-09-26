import 'package:doa_app/controller/cari_doa_controller.dart';
import 'package:doa_app/core/app_extension.dart';
import 'package:doa_app/page/component/data_item_doa.dart';
import 'package:doa_app/widget/empty_widget.dart';
import 'package:doa_app/widget/retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CariDoaPage extends StatelessWidget {
  CariDoaPage({super.key});

  final controller = Get.put(CariDoaController());
  final List<String> chipData = [
    'Doa sebelum makan',
    'Doa sesudah makan',
    'Doa keluar rumah',
    'Doa masuk rumah',
    'Doa naik kendaraan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: TextField(
          controller: controller.cariController.value,
          decoration: const InputDecoration(
            hintText: 'Cari doa...',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 16,
            ),
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            controller.getCariDoa();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: chipData.map((chipText) {
                  return InkWell(
                    onTap: () {
                      controller.cariController.value.text = chipText;
                      controller.getCariDoa();
                    },
                    child: Chip(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      backgroundColor: Colors.green,
                      label: Text(
                        chipText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Obx(() {
              return controller.firstLoad.value == true
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: controller.obx(
                        (doa) => DataItemDoa(doa!),
                        onLoading: const SpinKitCircle(
                          color: Colors.green,
                        ),
                        onError: (error) => RetryWidget(
                          message: "$error",
                          onRetryPressed: () => controller.getCariDoa(),
                        ),
                        onEmpty: const EmptyWidget(message: 'Tidak ada doa!'),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
