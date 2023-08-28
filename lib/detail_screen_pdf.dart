import 'package:flutter/material.dart';
import 'package:project_easy/info_map.dart';
import 'pdf_screen.dart';
import 'machine.dart';

class DetailScreenPdf extends StatefulWidget {
  final Machine machine;
  //Map<String, List<String>> pdfMap = regulatorMap();

  const DetailScreenPdf({
    Key? key,
    required this.machine,
  }) : super(key: key);

  @override
  State<DetailScreenPdf> createState() => _DetailScreenPdfState();
}

class _DetailScreenPdfState extends State<DetailScreenPdf> {
  Widget _defaultListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.machine.errorCodes.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          children: [
            ListTile(
              title: Text(
                widget.machine.errorCodes[i],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfScreen(machineName: regulatorMap().keys.elementAt(i), pdfFile: regulatorMap()[widget.machine.errorCodes[i]] ?? "ERROR - PDF not found"),
                    ));
              },
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machine.machineType),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _defaultListView(),
      ),
    );
  }
}
