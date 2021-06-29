import 'package:bloc/bloc.dart';

enum AuthEvent {increment}

class AuthBloc extends Bloc<AuthEvent, int> {
  AuthBloc() : super(0);

  @override
  Stream<int> mapEventToState(AuthEvent event) async* {
    switch (event) {
      case AuthEvent.increment:
        yield state + 1;
        break;
    }
  }
}