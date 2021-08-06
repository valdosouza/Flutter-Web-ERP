import 'package:equatable/equatable.dart';
import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(this.homeSalesPaymentTypeModel);

  final List<HomeSalesPaymentTypeModel> homeSalesPaymentTypeModel;

  @override
  List<Object> get props => [homeSalesPaymentTypeModel];
}

class HomeSuccessState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState(this.error);

  @override
  List<Object> get props => [error];
}
