import 'package:erpgestao/app/modules/home/presentation/pages/home_page_desktop.dart';
import 'package:erpgestao/app/modules/home/presentation/pages/home_page_mobile.dart';
import 'package:erpgestao/app/modules/home/presentation/pages/home_page_tablet.dart';
import 'package:erpgestao/responsive.dart';
import 'package:flutter/material.dart';

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
