import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PdfScreen extends StatefulWidget {
  final String pdfFile;

  const PdfScreen({super.key, required this.pdfFile});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        backgroundColor: Colors.purple,
      ),
      body: SfPdfViewer.asset(
        widget.pdfFile
        //"assets/my_document_0.pdf",
      ),
    );
  }
}
