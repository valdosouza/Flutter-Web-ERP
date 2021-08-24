import 'package:dartz/dartz.dart';
import 'package:erpgestao/app/core/error/failures.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:erpgestao/app/modules/home/data/remote/ownapi/home_datasource.dart';

import 'package:erpgestao/app/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;
  HomeRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<HomeSalesPaymentTypeModel>>> getFinancialClosed(
      {required String initialDate,
      required String finalDate,
      required String terminal}) async {
    try {
      final result = await datasource.getFinancialClosed(
        initialDate: initialDate,
        finalDate: finalDate,
        terminal: terminal,
      );

      return Right(result);
    } on Exception {
      return Left(throw UnimplementedError());
    }
  }
}
