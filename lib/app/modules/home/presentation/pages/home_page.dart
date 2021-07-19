import 'package:flutter/material.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_desktop.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_mobile.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_tablet.dart';
import 'package:frontend/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    return Responsive(
      // Let's work on our mobile part
      mobile: HomePageMobile(),
      tablet: HomePageTablet(),
      desktop: HomePageDesktop(),
    );
  }
}
