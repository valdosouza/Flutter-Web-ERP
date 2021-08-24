import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:erpgestao/app/core/error/failures.dart';
import 'package:erpgestao/app/core/usecase/usecase.dart';
import 'package:erpgestao/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:erpgestao/app/modules/home/domain/repositories/home_repository.dart';

class GetFinancialClosedUseCase
    implements UseCase<List<HomeSalesPaymentTypeModel>, Params> {
  final HomeRepository repository;

  GetFinancialClosedUseCase({required this.repository});

  @override
  Future<Either<Failure, List<HomeSalesPaymentTypeModel>>> call(
      Params params) async {
    return repository.getFinancialClosed(
      initialDate: params.finalDate,
      finalDate: params.finalDate,
      terminal: params.terminal,
    );
  }
}

class Params extends Equatable {
  final String initialDate;
  final String finalDate;
  final String terminal;
  const Params(
      {required this.initialDate,
      required this.finalDate,
      required this.terminal});

  @override
  List<Object?> get props => [initialDate, finalDate, terminal];
}
