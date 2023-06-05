import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviesapp/models/UpcomingMovies_model.dart';
import 'package:moviesapp/models/movies_details_model.dart';
import 'package:moviesapp/models/movies_video_model.dart';
import 'package:moviesapp/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MoviesController extends GetxController {
  //
  static List<dynamic> upcomingMovies = [];
  static bool isLoadingUpcommingMovies = true;
  static List<dynamic> searchMovies = [];
  static Map<String, dynamic> currentMovieDetails = {};
  static bool isLoadingMovieDetails = true;
  static String trailerId = '';
  final http.Client client;
  MoviesController({required this.client});

  @override
  void onInit() {
    super.onInit();
    getUpcomingMovies().then((value) => print('done'));
  }

  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    Uri url = Uri.parse('${AppConstants.baseURL}/3/movie/upcoming');
    var response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AppConstants.token
      },
    );

    if (response.statusCode == 200) {
      print('success');
      print(response.body);
      upcomingMovies.clear();
      upcomingMovies = jsonDecode(response.body)['results'];
      print(upcomingMovies[0]['original_title']);
      update();
      isLoadingUpcommingMovies = false;
      return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
    } else {
      print('failed');
      print(response.body);
      throw Exception('failed to get upcomming movies');

      // return true;
    }
  }

  //search movies by name
  Future<void> searchMovie(String searchkeywords) async {
    try {
      Uri url = Uri.parse(
          '${AppConstants.baseURL}/3/search/movie?query=$searchkeywords');
      var response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': AppConstants.token
        },
      );
      if (response.statusCode == 200) {
        print('success');
        // print(response.body);
        searchMovies.clear();
        searchMovies = jsonDecode(response.body)['results'];
        print(searchMovies[0]['original_title']);
        update();
        // return false;
      } else {
        print('failed');
        print(response.body);
        // return true;
      }
    } catch (e) {
      print('failed to get upcomming movies');
      print(e);
      // return true;
    }
  }

  //get movie details by movie Id;
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    Uri url = Uri.parse('${AppConstants.baseURL}/3/movie/$movieId');
    var response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AppConstants.token
      },
    );
    if (response.statusCode == 200) {
      print('success');
      print(response.body);
      currentMovieDetails.clear();
      currentMovieDetails = jsonDecode(response.body);
      print(currentMovieDetails['original_title']);
      print(currentMovieDetails['video']);
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      print('failed');
      print(response.body);
      throw Exception('failed to get movie details');
      // return true;
    }
  }

  Future<MovieVideosModel> getMovieVideos(String movieId) async {
    Uri url = Uri.parse('${AppConstants.baseURL}/3/movie/$movieId/videos');
    var response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AppConstants.token
      },
    );

    if (response.statusCode == 200) {
      print('success');
      print(response.body);

      var results = jsonDecode(response.body)['results'];
      await results.forEach((element) {
        if (element['type'] == 'Trailer') {
          trailerId = element['key'];
          print(trailerId);
        }
      });
      return MovieVideosModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get movie videos');
    }
  }
}
