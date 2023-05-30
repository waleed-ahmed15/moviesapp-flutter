import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';
import 'package:moviesapp/utils/app_colors.dart';
import 'package:moviesapp/utils/text_styles.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
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
                    color: const Color(0xff202C43),
                    size: 20.h,
                  ),
                ),
                SizedBox(
                  width: 26.w,
                ),
                Text(
                  '${MoviesController.searchMovies.length} Results Found',
                  style: title_text_Style.copyWith(
                    letterSpacing: 1,
                    color: const Color(0xff202C43),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: GetBuilder<MoviesController>(builder: (cc) {
                return Container(
                  decoration: BoxDecoration(color: AppColors.lighter_grey),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 30.h,
                    ),
                    itemCount: MoviesController.searchMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                    onError: (exception, stackTrace) {},
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${MoviesController.searchMovies[index]['poster_path']}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130.w,
                                  child: Text(
                                    MoviesController.searchMovies[index]
                                        ['original_title'],
                                    style: title_text_Style,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Action',
                                  style: genre_text_Style,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  print('more');
                                },
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: AppColors.light_blue,
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ));
  }
}
