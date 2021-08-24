import 'package:erpgestao/app/modules/home/presentation/component/header.dart';
import 'package:flutter/material.dart';

class ContentTablet extends StatelessWidget {
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
                  child: const Text('Body Tablet'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
