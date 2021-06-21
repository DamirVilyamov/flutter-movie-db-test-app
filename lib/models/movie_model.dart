import 'dart:core';

import 'package:flutter/cupertino.dart';

class Movie {
  final String posterPath;
  final bool isAdult;
  final String overview;
  final String releaseDate;
  final int id;
  final String title;
  final double voteAverage;
  final int voteCount;

  Movie({
    @required this.posterPath,
    @required this.isAdult,
    @required this.overview,
    @required this.releaseDate,
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.voteCount,
  });

  String getPhotoUrl() {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        posterPath: json['poster_path'],
        isAdult: json['adult'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        id: json['id'],
        title: json['title'],
        voteAverage: double.parse(json['vote_average'].toString()),
        voteCount: json['vote_count']);
  }

  @override
  String toString() {
    return '{ '
        'id: ${this.id} '
        'title: ${this.title} '
        'vote average: ${this.voteAverage} '
        'cote count: ${this.voteCount} '
        'release date: ${this.releaseDate} '
        'overview: ${this.overview} '
        'adult: ${this.isAdult} '
        'poster path: ${this.posterPath} '
        '} ';
  }
}
