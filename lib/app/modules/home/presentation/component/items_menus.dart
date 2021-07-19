import 'package:flutter/material.dart';
import 'package:frontend/app/core/shared/theme.dart';

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
