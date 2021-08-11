import 'package:flutter/cupertino.dart';
import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_payment_type.dart';

Widget listSalesPaymentType(
    BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  return Container(
    height: 300,
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SalesPaymentType(
          svgSrc: "../images/icons/Documents.svg",
          paymentType: list[index].paymentType.toString(),
          saleValues: list[index].totalValue.toStringAsFixed(2),
        );
      },
    ),
  );
}
