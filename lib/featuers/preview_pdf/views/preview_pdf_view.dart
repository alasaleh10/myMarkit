import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/featuers/preview_pdf/view_model/preview_pdf_cuibt/preview_pdf_cubit.dart';
import 'package:my_markit/featuers/preview_pdf/views/display_pdf.dart';

// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PreviewPdfView extends StatelessWidget {
  final File file;
  const PreviewPdfView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreviewPdfCubit()..getPdf(file: file),
      child: Scaffold(
          appBar: appBar(context, title: 'عرض الفاتورة'),
          body: BlocBuilder<PreviewPdfCubit, PreviewPdfState>(
            builder: (context, state) {
              if (state is PreviewPdfSucsess) {
                return DisplayPdf(
                  filePath: state.file.path,
                );
              } else {
                return const CustomLoading();
              }
            },
          )),
    );
  }
}
