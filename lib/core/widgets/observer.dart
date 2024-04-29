import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change$change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Close$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('error$error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('event$bloc');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('transate$bloc');
  }
}
