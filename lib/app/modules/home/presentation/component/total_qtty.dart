import 'package:flutter/material.dart';
import 'package:frontend/app/core/shared/theme.dart';

import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';

Widget totalQtdeSales(
    BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  double totalQtty = 0;

  for (HomeSalesPaymentTypeModel p in list) {
    totalQtty = totalQtty + p.totalQtty;
  }

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
          child: Text('Quantidade de Vendas'),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "${totalQtty.toStringAsFixed(0)}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
