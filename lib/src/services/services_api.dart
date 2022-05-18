import 'dart:convert';
import 'package:app/src/services/Model/Items.dart';
import 'package:http/http.dart' as http;

const API_KEY = "7f6f3f4c12ef22e95b3d29d59f37c360";
const URL_BASE = "https://api.themoviedb.org/3";
const LANGUAGE_BASE = "pt-BR";

class CategoriesService {
  Future<List<Items>> getMovies(endpoint) async {
    final response = await http.get(Uri.parse('$URL_BASE$endpoint'));

    final parsed = jsonDecode(response.body);

    print(parsed.runtimeType);

    return parsed['results']
        .map<Items>((json) => Items.fromJson(json))
        .toList();
  }

  List<Map<String, dynamic>> fetchCategories() {
    List<Map<String, dynamic>> categories = [
      {
        'name': "originals",
        'title': "Originais Netflix",
        'items': getMovies(
            '/discover/tv?with_networks=213&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "trending",
        'title': "Em alta",
        'items': getMovies(
            '/trending/all/week?language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "topRated",
        'title': "Populares",
        'items': getMovies(
            '/movie/top_rated?language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "action",
        'title': "Ação",
        'items': getMovies(
            '/discover/movie?with_genres=28&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "comedy",
        'title': "Comédia",
        'items': getMovies(
            '/discover/movie?with_genres=35&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "horror",
        'title': "Terror",
        'items': getMovies(
            '/discover/movie?with_genres=27&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "romances",
        'title': "Romances",
        'items': getMovies(
            '/discover/movie?with_genres=10749&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
      {
        'name': "documentaries",
        'title': "Documentários",
        'items': getMovies(
            '/discover/movie?with_genres=99&language=$LANGUAGE_BASE&api_key=$API_KEY'),
      },
    ];

    return categories;
  }

  Future<Object> getMoreInfo(id, isMovie) async {
    try {
      if (isMovie && id) {
        final response = await http.get(Uri.parse(
            '$URL_BASE/movie/$id?language=$LANGUAGE_BASE&api_key=$API_KEY'));
        return response.body;
      } else if (id) {
        final response = await http.get(Uri.parse(
            '$URL_BASE/tv/$id?language=$LANGUAGE_BASE&api_key=$API_KEY'));
        return response.body;
      }
    } catch (error) {
      print('Error in getMovies: $error');
    }
    return {};
  }
}
