import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';
import 'package:moviesapp/utils/app_colors.dart';

import '../../utils/text_styles.dart';

class WatchTabGenreScreen extends StatefulWidget {
  const WatchTabGenreScreen({super.key});

  @override
  State<WatchTabGenreScreen> createState() => _WatchTabGenreScreenState();
}

class _WatchTabGenreScreenState extends State<WatchTabGenreScreen> {
  List genres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Romance',
    'Science Fiction',
    'TV Movie',
    'Thriller',
    'War',
    'Western'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //Textformfield
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
              child: TextFormField(
                onTap: () {
                  globalCurrentIndexForWatchTab = 2;
                  globalPageControllerForWatchTab.animateToPage(
                    globalCurrentIndexForWatchTab,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.ease,
                  );
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xffF2F2F6),
                  filled: true,
                  hintText: 'TV shows, movies and more',
                  suffixIcon: Icon(
                    Icons.close,
                    size: 30.h,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20.h,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: AppColors.lighter_grey),
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Container(
                          width: 163.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${MoviesController.upcomingMovies[index + 4]['poster_path']}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 10.w, bottom: 10.h),
                                child: Text(
                                  genres[index + 3],
                                  style: title_text_Style.copyWith(
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 163.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${MoviesController.upcomingMovies[index + 1]['poster_path']}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 10.w, bottom: 10.h),
                                child: Text(
                                  genres[index],
                                  style: title_text_Style.copyWith(
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
          ],
        ));
  }
}
