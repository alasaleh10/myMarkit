import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/validation/validation.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

class AddInvoiceContiner extends StatefulWidget {
  final BuildContext context2;
  const AddInvoiceContiner({super.key, required this.context2});

  @override
  State<AddInvoiceContiner> createState() => _AddInvoiceContinerState();
}

class _AddInvoiceContinerState extends State<AddInvoiceContiner> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog.adaptive(
        icon: Form(
          key: BlocProvider.of<InvoiceCubit>(widget.context2).key,
          child: Column(
            children: [
              CustomTextFormFiald(
                  isValidator: true,
                  validator: (value) {
                    return validation(value!, 'caintName');
                  },
                  controller:
                      BlocProvider.of<InvoiceCubit>(widget.context2).clintName,
                  hintText: 'إسم الــعميل',
                  icon: FontAwesomeIcons.user),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        activeColor: AppColors.kPrimaryColor,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          'نقدا',
                          style: AppStyle.style19Regular(context),
                        ),
                        value: 1,
                        groupValue:
                            BlocProvider.of<InvoiceCubit>(widget.context2)
                                .invoiceType,
                        onChanged: (value) {
                          BlocProvider.of<InvoiceCubit>(widget.context2)
                              .setInvoiceType(invoiceType: 1);
                          setState(() {});
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        activeColor: AppColors.kPrimaryColor,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          'اجل',
                          style: AppStyle.style19Regular(context),
                        ),
                        value: 0,
                        groupValue:
                            BlocProvider.of<InvoiceCubit>(widget.context2)
                                .invoiceType,
                        onChanged: (value) {
                          BlocProvider.of<InvoiceCubit>(widget.context2)
                              .setInvoiceType(invoiceType: 0);
                          setState(() {});
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomElevatedButton(
                          title: 'إلــغاء',
                          onPressed: () {
                            context.pop();
                            BlocProvider.of<InvoiceCubit>(widget.context2)
                                .clearData();
                          })),
                  const SizedBox(width: 15),
                  Expanded(
                      child: CustomElevatedButton(
                          title: 'إضــافة',
                          onPressed: () {
                            if (BlocProvider.of<InvoiceCubit>(widget.context2)
                                    .invoiceType ==
                                null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar(context,
                                      title: 'الرجاء اختيار نوع الفاتورة'));
                            } else {
                              // context.pop();
                              BlocProvider.of<InvoiceCubit>(widget.context2)
                                  .addInvoiceToData();
                            }
                          }))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
