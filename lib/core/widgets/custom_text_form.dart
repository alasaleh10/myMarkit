import 'package:flutter/material.dart';
import 'package:my_markit/core/functions/text_form_border.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_fonts.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class CustomTextFormFiald extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextFormFiald(
      {super.key,
      required this.hintText,
      this.controller,
      required this.icon,
      this.keyboardType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        keyboardType: keyboardType,
        cursorColor: AppColors.kPrimaryColor,
        cursorHeight: 25,
        controller: controller,
        decoration: InputDecoration(
            labelText: hintText,
            labelStyle: AppStyle.style20Bold(context)
                .copyWith(fontFamily: AppFonts.twailtFont),
            suffixIcon: InkWell(
              child: Icon(
                icon,
                color: AppColors.kPrimaryColor,
                size: 25,
              ),
            ),
            hintText: hintText,
            hintStyle: AppStyle.style20Bold(context)
                .copyWith(fontFamily: AppFonts.twailtFont),
            errorBorder: textFormBorder(),
            disabledBorder: textFormBorder(),
            focusedBorder: textFormBorder(),
            enabledBorder: textFormBorder(),
            border: textFormBorder()),
      ),
    );
  }
}
