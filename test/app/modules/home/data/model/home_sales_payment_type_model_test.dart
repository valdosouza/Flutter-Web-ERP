import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final List<HomeSalesPaymentTypeModel> tListHomeSalesPaymentTypesModel = [
    const HomeSalesPaymentTypeModel(
      paymentType: "1 - DINHEIRO",
      totalValue: 6466.52,
      totalQtty: 2,
    ),
    const HomeSalesPaymentTypeModel(
      paymentType: "10 - ABRAPETITE",
      totalValue: 123.86,
      totalQtty: 3,
    )
  ];

  test('Should be a subclass of HomeSalesPaymentTypEntity', () async {
    // assert
    expect(tListHomeSalesPaymentTypesModel,
        isA<List<HomeSalesPaymentTypeModel>>());
  });

  test(
    'should return a valid model the JSON HomeSalePaymentType',
    () async {
      // arrange
      final String jsonString = fixture('home_sales_payment_type.json');
      final data = json.decode(jsonString);
      // act

      final result = (data as List).map((json) {
        return HomeSalesPaymentTypeModel(
          paymentType: json['description'].toString(),
          totalValue: double.parse(json['totalValue'].toString()),
          totalQtty: int.parse(json['totalQtty'].toString()),
        );
      }).toList();
      // assert
      expect(result, tListHomeSalesPaymentTypesModel);
    },
  );
}
