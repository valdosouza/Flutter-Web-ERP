import 'package:frontend/app/modules/home/domain/entities/home_sales_payment_type_entity.dart';

class HomeSalesPaymentTypeModel extends HomeSalesPaymentTypeEntity {
  const HomeSalesPaymentTypeModel({
    required String paymentType,
    required int totalQtty,
    required double totalValue,
  }) : super(
          paymentType: paymentType,
          totalQtty: totalQtty,
          totalValue: totalValue,
        );

  factory HomeSalesPaymentTypeModel.fromJson(Map<String, dynamic> json) {
    return HomeSalesPaymentTypeModel(
      paymentType: json['paymentType'].toString(),
      totalQtty: int.parse(json['totalQtty'].toString()),
      totalValue: double.parse(json['totalValue'].toString()),
    );
  }
}
