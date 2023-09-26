import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../model/response_data_doa.dart';

class DataItemDoa extends StatelessWidget {
  const DataItemDoa(this.doa, {super.key});

  final ResponseDataDoa doa;

  void _copyAllDataToClipboard() {
    final String allData =
        "${doa.doa ?? ""}\n${doa.ayat ?? ""}\n${doa.latin ?? ""}\nartinya : ${doa.artinya}";
    Clipboard.setData(ClipboardData(text: allData));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                doa.doa ?? "",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: _copyAllDataToClipboard,
              child: const Icon(Icons.copy, size: 16),
            )
          ],
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Text(
              doa.ayat ?? "",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              doa.latin ?? "",
              style: const TextStyle(fontSize: 12, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Text(
              "artinya : ${doa.artinya}",
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
