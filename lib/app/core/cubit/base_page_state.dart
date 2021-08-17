import 'package:equatable/equatable.dart';

class BasePageState extends Equatable {
  final bool logged;

  const BasePageState.initial() : logged = false;
  const BasePageState.logged({required this.logged});

  @override
  List<Object> get props => [logged];
}
