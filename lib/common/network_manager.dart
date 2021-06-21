import 'dart:convert';

import 'package:data_prime_test_app/common/constants.dart';
import 'package:data_prime_test_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  static final NetworkManager _networkManager = NetworkManager._internal();

  NetworkManager._internal();

  factory NetworkManager() {
    return _networkManager;
  }

  Future<List<Movie>> getPopularMovies({int pageNumber = 1}) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.API_KEY}&language=en-US&page=$pageNumber"));
    if (response.statusCode == Constants.STATUS_CODE_SUCCESS) {
      final results = List.from(jsonDecode(response.body)['results']);
      List<Movie> movies = results.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } else {
      throw Exception('Failed to get popular movies');
    }
  }
}
