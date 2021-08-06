import 'package:flutter/cupertino.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_payment_type.dart';

class ListSalesPaymentType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SalesPaymentType(
      svgSrc: "./images/icons/Documents.svg",
      paymentType: "DINHEIRO",
      saleValues: 100.0,
    );
  }
}
