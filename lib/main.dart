import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_prime_test_app/common/bloc/internet_cubit.dart';
import 'package:data_prime_test_app/router.dart';
import 'package:data_prime_test_app/popular_movies/bloc/popular_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({
    Key key,
    @required this.connectivity,
    this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<PopularMoviesCubit>(
          create: (context) => PopularMoviesCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Popular Movies App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
