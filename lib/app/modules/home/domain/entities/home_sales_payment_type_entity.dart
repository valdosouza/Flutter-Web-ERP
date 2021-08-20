import 'package:equatable/equatable.dart';

class HomeSalesPaymentTypeEntity extends Equatable {
  final String paymentType;
  final int totalQtty;
  final double totalValue;

  const HomeSalesPaymentTypeEntity({
    required this.paymentType,
    required this.totalQtty,
    required this.totalValue,
  });

  @override
  List<Object> get props => [paymentType, totalQtty, totalValue];
}
