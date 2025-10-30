import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravely/repository/user_repository.dart';
import 'package:mytravely/screens/home_screen.dart';
import 'package:mytravely/screens/login_screen.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/hotel_bloc/hotels_bloc.dart';
import 'repository/HotelApiProvider.dart';
import 'bloc/auth_bloc/auth_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(HotelApiProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider(
            create: (context) => HotelsBloc(
              RepositoryProvider.of<UserRepository>(context),
              context.read<AuthBloc>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Travaly',
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                return HomeScreen(userName: state.userName);
              } else {
                return LoginScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}