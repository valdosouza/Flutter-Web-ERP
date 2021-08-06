import 'package:flutter/material.dart';

import 'package:frontend/app/core/shared/theme.dart';

class SalesDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: kPrimaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text("Data: 24/07/2021"),
          ),
        ],
      ),
    );
  }
}
