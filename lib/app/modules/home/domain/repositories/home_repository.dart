import 'package:dartz/dartz.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeSalesPaymentTypeModel>>> getFinancialClosed({
    required String initialDate,
    required String finalDate,
  });
}
