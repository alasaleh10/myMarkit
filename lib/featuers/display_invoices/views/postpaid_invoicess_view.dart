import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/display_invoices/data/invoicess_repo_im.dart';
import 'package:my_markit/featuers/display_invoices/view_model/get_invoicess_cuibt/get_invoicsess_cubit.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/invoicess_clints_names.dart';

class PostpaidInvoicessView extends StatelessWidget {
  const PostpaidInvoicessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetInvoicsessCubit(InvoicsessRepoIm())..getInvoicess(type: 0),
      child: Column(
        children: [
          BlocBuilder<GetInvoicsessCubit, GetInvoicsessState>(
            builder: (context, state) {
              return CustomTextFormFiald(
                  onChanged: (value) {
                    BlocProvider.of<GetInvoicsessCubit>(context)
                        .searchClintInvoice(type: 0, name: value!);
                  },
                  hintText: 'بــحث عن عميل',
                  icon: FontAwesomeIcons.searchengin);
            },
          ),
          BlocBuilder<GetInvoicsessCubit, GetInvoicsessState>(
            builder: (context, state) {
              if (state is GetInvoicsessFailure) {
                return Expanded(
                    child: Center(
                        child: ErrorText(errorMessage: state.errorMessage)));
              } else if (state is GetInvoicsessSucsess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.invoicess.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InvoicessClintsNames(
                        invoiveClintModel: state.invoicess[index],
                      );
                    },
                  ),
                );
              } else {
                return const Expanded(child: Center(child: CustomLoading()));
              }
            },
          ),
        ],
      ),
    );
  }
}
