import 'package:erpgestao/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class ItemsMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: kBgDarkColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Container(
                width: 849,
                color: kBgDarkColor,
                child: const Text('Items Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
