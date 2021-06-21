import 'package:data_prime_test_app/movie_details/movie_details_screen.dart';
import 'package:data_prime_test_app/popular_movies/ui/popular_movies_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PopularMoviesScreen()); // temporary main screen
        break;

      case PopularMoviesScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (_) => PopularMoviesScreen());
        break;

      case MovieDetailsScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen(), settings: routeSettings);
        break;

      default:
        return null;
    }
  }
}
