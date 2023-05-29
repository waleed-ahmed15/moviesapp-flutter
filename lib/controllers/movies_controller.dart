import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviesapp/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MoviesController extends GetxController {
  //
  static List<dynamic> upcomingMovies = [];
  static bool isLoadingUpcommingMovies = true;
  static List<dynamic> searchMovies = [];

  @override
  void onInit() {
    super.onInit();
    getUpcomingMovies().then((value) => print('done'));
  }

  Future<void> getUpcomingMovies() async {
    try {
      Uri url = Uri.parse('${AppConstants.baseURL}/3/movie/upcoming');
      var response = await http.get(
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

  //search movies by name
  Future<void> searchMovie(String searchkeywords) async {
    try {
      Uri url = Uri.parse(
          '${AppConstants.baseURL}/3/search/movie?query=$searchkeywords');
      var response = await http.get(
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
}
