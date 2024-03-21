import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class RowTitles extends StatelessWidget {
  const RowTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'الـيوم',
              style: AppStyle.style20Bold(context),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'الــوصف',
              style: AppStyle.style20Bold(context),
            ),
          ),
          Expanded(
              child: Text(
            'الـسعر',
            style: AppStyle.style20Bold(context),
          ))
        ],
      ),
    );
  }
}
