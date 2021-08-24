import 'dart:convert';
import 'package:erpgestao/app/core/error/exceptions.dart';
import 'package:erpgestao/app/core/shared/constants.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Calls the https://www.api.gestaosetes.com.br/financial/getClosed/ endpoint.
///
/// Throws a [ServerException] for all error codes.
abstract class HomeDatasource {
  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed(
      {required String initialDate,
      required String finalDate,
      required String terminal});
}

class HomeDatasourceImpl implements HomeDatasource {
  final _baseUrl = '${Constants.baseApiUrl}/financial/getClosed/';
  final client = http.Client();
  //List<HomeSalesPaymentTypeModel> homeSalesPaymentTypesModel = [];
  @override
  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed(
      {required String initialDate,
      required String finalDate,
      required String terminal}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final institution = sp.getString('institution') ?? 1223;

    final response = await client.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'initialDate': "$initialDate",
          'finalDate': "$finalDate",
          'institution': "${institution.toString()}",
          'terminal': "$terminal",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<HomeSalesPaymentTypeModel> homeSalesPaymentTypesModel =
          (data as List).map((json) {
        return HomeSalesPaymentTypeModel(
          paymentType: json['paymentType'].toString(),
          totalQtty: int.parse(json['totalQtty'].toString()),
          totalValue: double.parse(json['totalValue'].toString()),
        );
      }).toList();
      return homeSalesPaymentTypesModel;
    } else {
      throw ServerException();
    }
  }
}
