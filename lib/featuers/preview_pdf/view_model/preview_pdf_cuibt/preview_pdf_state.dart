part of 'preview_pdf_cubit.dart';

sealed class PreviewPdfState {}

final class PreviewPdfInitial extends PreviewPdfState {}

final class PreviewPdfLoading extends PreviewPdfState {}

final class PreviewPdfSucsess extends PreviewPdfState {
  final File file;

  PreviewPdfSucsess({required this.file});
}
