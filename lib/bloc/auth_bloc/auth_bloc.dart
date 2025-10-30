import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/user_repository.dart';
import '../../utils/app_constant.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(AuthInitial()) {
    on<AuthGoogleSignInRequested>(_onGoogleSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onGoogleSignInRequested(
      AuthGoogleSignInRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      await _userRepository.signInWithGoogle();
      emit(AuthAuthenticated(userName: 'User Name', token: ''));
    } catch (e) {
      emit(AuthError(AppConstant.gSignInFailMsg));
    }
  }

  Future<void> _onSignOutRequested(
      AuthSignOutRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      await _userRepository.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(AppConstant.gSignOutFailMsg));
    }
  }
}
