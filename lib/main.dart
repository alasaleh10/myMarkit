import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_markit/core/routers/routers.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/core/utils/app_theam.dart';
import 'package:my_markit/core/widgets/observer.dart';
import 'package:my_markit/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SqlHeper.inizalizeDb();
  Bloc.observer = SimpleObserver();

  runApp(const MyMarket());
}

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: Routers.routers,
      theme: AppTheame.theamdata,
      debugShowCheckedModeBanner: false,
    );
  }
}
