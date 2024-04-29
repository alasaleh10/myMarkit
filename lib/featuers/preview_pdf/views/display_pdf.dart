import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class DisplayPdf extends StatelessWidget {
  final String filePath;
  const DisplayPdf({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
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
                  await Share.shareXFiles([XFile(filePath)]);
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
            filePath: filePath,
          ),
        ),
        // Expanded(child: SizedBox())
      ],
    );
  }
}
