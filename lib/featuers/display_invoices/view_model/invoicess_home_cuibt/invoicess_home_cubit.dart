import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'invoicess_home_state.dart';

class InvoicessHomeCubit extends Cubit<InvoicessHomeState> {
  InvoicessHomeCubit() : super(InvoicessHomeInitial());

  PageController pageController = PageController();
  int index = 0;

  void goPage({required int index}) {
    this.index = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
    emit(InvoicessHomeInitial());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
