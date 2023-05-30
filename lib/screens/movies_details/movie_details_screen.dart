import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/utils/app_colors.dart';
import 'package:moviesapp/utils/text_styles.dart';

import '../watch_tab/watch_tab_page_controller.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  end: Alignment.center,
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black38, Colors.black],
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${MoviesController.currentMovieDetails['poster_path']}'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 466.h,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      IconButton(
                        onPressed: () {
                          globalCurrentIndexForWatchTab = 0;
                          globalPageControllerForWatchTab.animateToPage(
                            globalCurrentIndexForWatchTab,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                          // Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0.w),
                        child: Text(
                          'Watch',
                          style: title_text_Style.copyWith(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 180.h,
                  ),
                  Text(
                    'In Theatres December 22, 2021',
                    style: title_text_Style.copyWith(
                        color: Colors.white, letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(243.w, 50.h),
                      backgroundColor: AppColors.light_blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Get Tickets',
                      style: button_text_Style.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(243.w, 50.h),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.light_blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_arrow_rounded,
                            color: Colors.white),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Watch Trailer',
                          style: button_text_Style.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genres',
                    style: title_text_Style.copyWith(
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          MoviesController.currentMovieDetails['genres'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 24.h,
                          // width: 65.h,

                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: AppColors.genreColors[index % 4],
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child: Text(
                                MoviesController.currentMovieDetails['genres']
                                    [index]['name'],
                                style: details_genre_text_Style),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Text(
                    'Overview',
                    style: title_text_Style.copyWith(
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    MoviesController.currentMovieDetails['overview'],
                    style: details_overview_text_Style,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
