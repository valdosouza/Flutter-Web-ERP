import 'package:flutter/material.dart';

import 'package:frontend/app/modules/home/presentation/component/header.dart';

class ContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              const Divider(thickness: 1),
              Center(
                child: Container(
                  child: const Text('Body Desktop'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
