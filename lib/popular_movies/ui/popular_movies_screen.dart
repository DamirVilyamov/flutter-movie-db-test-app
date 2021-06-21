import 'package:data_prime_test_app/common/bloc/internet_cubit.dart';
import 'package:data_prime_test_app/common/bloc/internet_state.dart';
import 'package:data_prime_test_app/models/movie_model.dart';
import 'package:data_prime_test_app/movie_details/movie_details_screen.dart';
import 'package:data_prime_test_app/popular_movies/bloc/popular_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesScreen extends StatefulWidget {
  PopularMoviesScreen({Key key}) : super(key: key);

  static const ROUTE_NAME = '/popular_movies';

  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesBloc = context.bloc<PopularMoviesCubit>();

    Widget buildListItem(Movie movie) {
      return Container(
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, MovieDetailsScreen.ROUTE_NAME, arguments: movie);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 33,
                    child: Image.network(
                      movie.getPhotoUrl(),
                    ),
                  ),
                  Expanded(
                    flex: 66,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 30,
                          child: Container(
                            child: Text(
                              '${movie.title}',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          flex: 50,
                          child: Container(
                            child: Text(
                              '${movie.overview}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            child:
                                Text('Rating ${movie.voteAverage}/10', textAlign: TextAlign.start),
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 8),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetLoading) {
          moviesBloc.emitLoadingState();
        } else if (state is InternetDisconnected) {
          moviesBloc.emitNoDataState();
        } else if (state is InternetConnected) {
          moviesBloc.getMovies();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xDDFFFFFF),
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return Center(
                child: Text('LOADING...'),
              );
            }

            if (state is MoviesNoDataState) {
              return Center(
                child: Text('NO DATA...'),
              );
            }

            if (state is MoviesLoadedState) {
              return Container(
                child: ListView.builder(
                  itemCount: state.movies.length - 1,
                  itemBuilder: (ctx, index) {
                    return buildListItem(state.movies[index]);
                  },
                ),
              );
            } else {
              return Center(
                child: Text('UNDEFINED STATE?'),
              );
            }
          },
        ),
      ),
    );
  }
}
