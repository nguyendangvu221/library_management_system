import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key, required this.pdfUrl});
  final String pdfUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.network(
      pdfUrl,
    ));
  }
}
