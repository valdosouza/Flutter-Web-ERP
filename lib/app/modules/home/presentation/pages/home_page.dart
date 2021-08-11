import 'package:flutter/material.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_desktop.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_mobile.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page_tablet.dart';
import 'package:frontend/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomePageMobile(),
      tablet: HomePageTablet(),
      desktop: HomePageDesktop(),
    );
  }
}
