import 'dart:async';

import 'package:data_prime_test_app/common/network_manager.dart';
import 'package:data_prime_test_app/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(MoviesLoadingState());

  void getMovies() async {
    await NetworkManager()
        .getPopularMovies()
        .then((value) => emit(MoviesLoadedState(movies: value)));
  }

  void emitLoadingState() {
    emit(MoviesLoadingState());
  }

  void emitNoDataState() {
    emit(MoviesNoDataState());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
