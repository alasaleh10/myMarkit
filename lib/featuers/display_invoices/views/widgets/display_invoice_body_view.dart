import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/display_invoices/view_model/display_invoicess_cuibt/display_invoicess_cubit.dart';
import 'package:share_plus/share_plus.dart';

class DisplayInvoicessBodyView extends StatelessWidget {
  const DisplayInvoicessBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayInvoicessCubit, DisplayInvoicessState>(
      builder: (context, state) {
        if (state is DisplayInvoicessFailure) {
          return ErrorText(
            errorMessage: state.errorMessage,
          );
        } else if (state is DisplayInvoicessSucsess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kPrimaryColor),
                  child: IconButton(
                      onPressed: () async {
                        await Share.shareXFiles([XFile(state.file.path)]);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.shareNodes,
                        color: AppColors.kPrimiryColor3,
                      )),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: PDFView(
                  fitEachPage: true,
                  filePath: state.file.path,
                ),
              ),
              // Expanded(child: SizedBox())
            ],
          );
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
