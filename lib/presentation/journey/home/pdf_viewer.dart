import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({
    super.key,
    required this.pdfUrl,
    required this.namePdf,
  });
  final String pdfUrl;
  final String namePdf;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            namePdf,
            style: AppTheme.textM.copyWith(
              color: AppColor.blue.shade700,
              fontSize: 20.sp,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.blue.shade700,
              size: 30,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: SfPdfViewer.network(
            pdfUrl,
          ),
        ));
  }
}
