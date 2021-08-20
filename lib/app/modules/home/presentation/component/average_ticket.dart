import 'package:flutter/material.dart';
import 'package:frontend/app/core/shared/theme.dart';

import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:intl/intl.dart';

Widget averageTicket(
    BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  double totalQtty = 0;
  double totalValue = 0;
  double averageValue = 0;

  for (HomeSalesPaymentTypeModel p in list) {
    totalQtty = totalQtty + p.totalQtty;
    totalValue = totalValue + p.totalValue;
  }
  if (totalQtty > 0) {
    averageValue = totalValue / totalQtty;
  } else {
    averageValue = 0;
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
          child: Text('Ticket Médio'),
        ),
        Expanded(
          flex: 2,
          child: Text(
            " ${brF.format(averageValue)}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
