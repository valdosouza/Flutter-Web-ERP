import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/core/shared/theme.dart';

import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';

Widget salesChart(BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  List<PieChartSectionData> paiChartSelectionDatas = [];
  double totalValue;

  final List colors = [
    kPrimaryColor,
    const Color(0xFF26E5FF),
    const Color(0xFFFFCF26),
    const Color(0xFFEE2727),
    kPrimaryColor.withOpacity(0.1),
  ];

  totalValue = 0;
  int contador = 0;

  for (HomeSalesPaymentTypeModel p in list) {
    totalValue = totalValue + p.totalValue;
    if (contador < 5) {
      paiChartSelectionDatas.add(
        PieChartSectionData(
          color: colors[contador] as Color,
          value: p.totalValue,
          showTitle: false,
          radius: 25,
        ),
      );
    }
    contador++;
  }

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
                "R\$ ${totalValue.toStringAsFixed(2)}",
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
