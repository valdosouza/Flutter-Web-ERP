import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/core/shared/theme.dart';
import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';

Widget salesChart(BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  return Container(
    height: 200,
    child: Stack(
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            startDegreeOffset: -90,
            sections: paiChartSelectionDatas,
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Text(
                "R\$ 1.000,00",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      height: 0.5,
                      fontSize: 20.0,
                    ),
              ),
              const Text("Vendas"),
            ],
          ),
        ),
      ],
    ),
  );
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: kPrimaryColor,
    value: 25,
    showTitle: true,
    radius: 25,
  ),
  PieChartSectionData(
    color: const Color(0xFF26E5FF),
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: const Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: const Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: kPrimaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 25,
  ),
];
