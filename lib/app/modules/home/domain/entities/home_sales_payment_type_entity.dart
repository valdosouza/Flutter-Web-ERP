import 'package:equatable/equatable.dart';

class HomeSalesPaymentTypeEntity extends Equatable {
  final String paymentType;
  final double totalValue;

  const HomeSalesPaymentTypeEntity({
    required this.paymentType,
    required this.totalValue,
  });

  @override
  List<Object?> get props => [paymentType, totalValue];
}
