import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviesapp/controllers/movies_controller.dart';
import 'package:moviesapp/screens/home/widgets/text_icon_row.dart';
import 'package:moviesapp/screens/movies_details/movie_details_screen.dart';
import 'package:moviesapp/utils/app_colors.dart';
import 'package:moviesapp/utils/text_styles.dart';

class WatchTabScreen extends StatelessWidget {
  const WatchTabScreen({super.key});

  // bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35.h, left: 20.w, right: 20.w),
            child: const Watch_Search_Row(),
          ),
          SizedBox(
            height: 22.h,
          ),
          Expanded(
            child: GetBuilder<MoviesController>(builder: (context) {
              if (MoviesController.isLoadingUpcommingMovies) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                color: AppColors.lighter_grey,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 30.h,
                  ),
                  itemCount: MoviesController.upcomingMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await Get.find<MoviesController>().getMovieDetails(
                            MoviesController.upcomingMovies[index]['id']
                                .toString());
                        Get.to(
                          () => const MovieDetailsScreen(
                              // movie: MoviesController.upcomingMovies[index],
                              ),
                        );
                      },
                      child: Container(
                        height: 180.h,
                        width: 335.w,
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${MoviesController.upcomingMovies[index]['poster_path']}'),
                              fit: BoxFit.cover,
                            ),),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black38,
                                Colors.black
                              ],
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
                                  MoviesController.upcomingMovies[index]
                                      ['original_title'],
                                  style: title_text_Style.copyWith(
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
