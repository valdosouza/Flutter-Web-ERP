import 'package:equatable/equatable.dart';

class DrawerState extends Equatable {
  final bool logout;

  const DrawerState.initial() : logout = false;
  const DrawerState.logout({required this.logout});

  @override
  List<Object> get props => [logout];
}
