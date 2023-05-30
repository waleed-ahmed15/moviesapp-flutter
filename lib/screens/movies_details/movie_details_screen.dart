import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/controllers/movies_controller.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${MoviesController.currentMovieDetails['poster_path']}'),
              fit: BoxFit.cover,
            ),
          ),
          height: 466.h,
          width: double.infinity,
        ),
      ]),
    );
  }
}
