import 'dart:convert';
import 'package:frontend/app/core/error/exceptions.dart';
import 'package:frontend/app/core/shared/constants.dart';

import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Calls the https://www.api.gestaosetes.com.br/financial/getClosed/ endpoint.
///
/// Throws a [ServerException] for all error codes.
abstract class HomeDatasource {
  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed(
      {required String initialDate, required String finalDate});
}

class HomeDatasourceImpl implements HomeDatasource {
  final _baseUrl = '${Constants.baseApiUrl}/financial/getClosed/';
  final client = http.Client();
  List<HomeSalesPaymentTypeModel> homeSalesPaymentTypesModel = [];
  @override
  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed(
      {required String initialDate, required String finalDate}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final institution = sp.getString('institution');
    final response = await client.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'initialDate': "${initialDate}",
          'finalDate': "${finalDate}",
          'institution': "${institution}",
        },
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return homeSalesPaymentTypesModel = (data as List).map((json) {
        return HomeSalesPaymentTypeModel(
          paymentType: json['paymentType'].toString(),
          totalValue: double.parse(json['totalValue'].toString()),
        );
      }).toList();
    } else {
      throw ServerException();
    }
  }
}
