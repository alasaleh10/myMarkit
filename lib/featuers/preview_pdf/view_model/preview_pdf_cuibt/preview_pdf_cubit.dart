import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'preview_pdf_state.dart';

class PreviewPdfCubit extends Cubit<PreviewPdfState> {
  PreviewPdfCubit() : super(PreviewPdfInitial());

  void getPdf({required File file}) async {
    emit(PreviewPdfLoading());
    emit(PreviewPdfSucsess(file: file));
  }
}
