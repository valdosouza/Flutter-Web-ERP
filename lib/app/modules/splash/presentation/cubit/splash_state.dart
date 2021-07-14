import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool logged;

  const SplashState.initial() : logged = false;
  const SplashState.logged({required this.logged});

  @override
  List<Object> get props => [logged];
}
