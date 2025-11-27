import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/popular.dart';

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '78b737b465691f24880a80646dcceb1e';
  final String _language = 'es-ES';
  final String _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  MoviesProvider() {
    print("Movies Provider initialized");
    getOnDisplayMovies();
    getOnPopularMovies();
    // getCrew(0);
  }

  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(result.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getOnPopularMovies() async {
    print("Obteniendo popular movies");
    var url = Uri.https(_baseUrl, '3/movie/popular', {'api_key': _apiKey, 'language': _language, 'page': _page});

    final result = await http.get(url);
    print("Result: " + result.body);
  
    final popularResponse = Popular.fromJson(result.body);
    print(popularResponse);

    popularMovies = popularResponse.results;
    notifyListeners();
  }

  Future<List<Cast>> getCrew(int movieId) async {
    print("Obteniendo crew for movieId: $movieId");
    var url = Uri.https(_baseUrl, '3/movie/$movieId/credits', {'api_key': _apiKey, 'language': _language});

    final result = await http.get(url);

    final CreditsResponse creditsResponse = CreditsResponse.fromJson(result.body);
    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
