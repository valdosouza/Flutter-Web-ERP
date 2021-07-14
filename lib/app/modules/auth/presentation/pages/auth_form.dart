abstract class AuthForm {
  const AuthForm();
}

class InitialAuthFormStatus extends AuthForm {
  const InitialAuthFormStatus();
}

class AuthFormSubmitting extends AuthForm {}

class AuthFormSubmissionSuccess extends AuthForm {}

class AuthFormSubmissionFailed extends AuthForm {
  final Exception exception;

  AuthFormSubmissionFailed(this.exception);
}
