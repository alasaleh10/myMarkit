import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/home/prsentation/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'حســاباتــي'),
      body: const HomeBodyView(),
    );
  }
}
