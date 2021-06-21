part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

class MoviesLoadedState extends PopularMoviesState {
  List<Movie> movies;

  MoviesLoadedState({@required this.movies});
}

class MoviesLoadingState extends PopularMoviesState {}

class MoviesNoDataState extends PopularMoviesState {}
