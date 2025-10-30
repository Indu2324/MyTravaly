abstract class AuthEvent {}

class AuthGoogleSignInRequested extends AuthEvent {}
class AuthSignOutRequested extends AuthEvent {}