import 'package:dartz/dartz.dart';
import 'package:erpgestao/app/core/error/failures.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeSalesPaymentTypeModel>>> getFinancialClosed({
    required String initialDate,
    required String finalDate,
    required String terminal,
  });
}
