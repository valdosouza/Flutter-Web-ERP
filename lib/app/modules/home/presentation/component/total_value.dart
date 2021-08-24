import 'package:erpgestao/app/core/shared/theme.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget totalValueSales(
    BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  double totalValue = 0;

  for (HomeSalesPaymentTypeModel p in list) {
    totalValue = totalValue + p.totalValue;
  }
  final brF = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  return Container(
    margin: const EdgeInsets.all(5), //only(top: kDefaultPadding),
    padding: const EdgeInsets.all(kDefaultPadding),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: kPrimaryColor.withOpacity(0.15),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(kDefaultPadding),
      ),
    ),
    child: Row(
      children: [
        const Expanded(
          flex: 5,
          child: Text("Valor total de Vendas"),
        ),
        Expanded(
          flex: 2,
          child: Text(
            " ${brF.format(totalValue)}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
