import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';
import 'package:moviesapp/utils/app_colors.dart';
import 'package:moviesapp/utils/text_styles.dart';

class WatchTabSearchScreen extends StatefulWidget {
  const WatchTabSearchScreen({super.key});

  @override
  State<WatchTabSearchScreen> createState() => _WatchTabSearchScreenState();
}

class _WatchTabSearchScreenState extends State<WatchTabSearchScreen> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) {
                print(value);
                if (value.isNotEmpty) {
                  globalCurrentIndexForWatchTab = 3;
                  globalPageControllerForWatchTab.animateToPage(
                    globalCurrentIndexForWatchTab,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.ease,
                  );
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Get.find<MoviesController>().searchMovie(value);
                }
              },
              decoration: InputDecoration(
                fillColor: const Color(0xffF2F2F6),
                filled: true,
                hintText: 'TV shows, movies and more',
                suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                      MoviesController.searchMovies.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30.h,
                    )),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.h,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColors.lighter_grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Top Results',
                    style: top_results,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: GetBuilder<MoviesController>(builder: (cc) {
                      return ListView.builder(
                        itemCount: MoviesController.searchMovies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.h),
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
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
