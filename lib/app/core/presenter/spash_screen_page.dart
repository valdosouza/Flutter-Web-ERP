import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              "images/logo_setes.png",
              width: 450,
              height: 140,
              fit: BoxFit.fill,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
