import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app/models/movies_model.dart';

class ApiServices {
  final apiKey = "api_key=f401fafc5231b21eb8e8759905a72e1c";
  final popularurl = "https://api.themoviedb.org/3/movie/popular?";
  final nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?";
  Future<List<MoviesModel>> fetchmovies() async {
    final response = await http.get(Uri.parse('$popularurl$apiKey'));
    Logger().f('$popularurl$apiKey');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      Logger().f("body-$body");
      Logger().f("result-$result");
      List<MoviesModel> movies = result
          .map((movie) => MoviesModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      Logger().f(movies[0].overview);
      Logger().f(movies[0].backdropPath);
      return movies;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
      return [];
    }
  }

  Future<List<MoviesModel>> nowplaying() async {
    final response = await http.get(Uri.parse('$nowPlayingUrl$apiKey'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      Logger().f("body-$body");
      Logger().f("result-$result");
      List<MoviesModel> movies = result
          .map((movie) => MoviesModel.fromJson(movie as Map<String, dynamic>))
          .toList();
      Logger().f(movies[0].overview);
      Logger().f(movies[0].backdropPath);
      return movies;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
      return [];
    }
  }
}
