import 'package:data_prime_test_app/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/movie_details';

  MovieDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: double.infinity,
              height: 200,
              child: Image.network(movie.getPhotoUrl()),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.overview,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Release date: " + movie.releaseDate),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Vote average: " + movie.voteAverage.toString() + "/10"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Votes: " + movie.voteCount.toString()),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
