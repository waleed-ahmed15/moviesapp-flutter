import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/utils/app_colors.dart';
import 'package:moviesapp/utils/text_styles.dart';

class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 123.h,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xff202C43),
              size: 20.h,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "The Kings Man",
                style: title_text_Style,
              ),
              Text(
                'In Theaters Dec 22, 2021',
                style: genre_text_Style.copyWith(
                    color: AppColors.light_blue, letterSpacing: 1),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(color: AppColors.lighter_grey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(),
              SizedBox(
                height: 94.h,
              ),
              Text(
                'Date',
                style: title_text_Style,
              ),
              SizedBox(
                height: 14.h,
              ),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 24.h,
                      // width: 65.h,

                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? AppColors.light_blue
                            : AppColors.light_grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Text(
                          'Mar ${index + 1}',
                          style: details_genre_text_Style.copyWith(
                              color: index == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.w),
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '12:30',
                                style: genre_text_Style.copyWith(
                                  color: const Color(0xff202C43),
                                ),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                "Cinetech + Hall ${index + 1}",
                                style: details_overview_text_Style,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: 249.h,
                            height: 145.h,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: AppColors.light_blue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    10,
                                    (index) => Container(
                                      margin: EdgeInsets.only(bottom: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            3,
                                            (index) => Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Icon(
                                                    Icons.monitor_rounded,
                                                    size: 5.h,
                                                    color: index % 3 == 0
                                                        ? index % 6 == 0
                                                            ? AppColors
                                                                .light_blue
                                                            : AppColors
                                                                .light_grey
                                                        : Colors.teal,
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    10,
                                    (index) => Container(
                                      margin: EdgeInsets.only(bottom: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            10,
                                            (index) => Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Icon(
                                                    Icons.monitor,
                                                    size: 6.h,
                                                    color: index % 3 == 0
                                                        ? index % 6 == 0
                                                            ? AppColors
                                                                .light_blue
                                                            : AppColors
                                                                .light_grey
                                                        : Colors.teal,
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    10,
                                    (index) => Container(
                                      margin: EdgeInsets.only(bottom: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          3,
                                          (index) => Container(
                                            margin: EdgeInsets.only(left: 5.w),
                                            child: Icon(
                                              Icons.monitor,
                                              size: 5.h,
                                              color: index % 3 == 0
                                                  ? index % 6 == 0
                                                      ? AppColors.light_blue
                                                      : AppColors.light_grey
                                                  : Colors.teal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "From",
                                style: details_overview_text_Style,
                              ),
                              Text(
                                " \$ 12.99",
                                style: button_text_Style.copyWith(
                                    color: Colors.black, fontSize: 12.sp),
                              ),
                              Text(
                                " or ",
                                style: details_overview_text_Style,
                              ),
                              Text(
                                "2500 Bonus",
                                style: button_text_Style.copyWith(
                                    color: Colors.black, fontSize: 12.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 26.h, left: 26.w, right: 26.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.light_blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              minimumSize: Size(323.w, 50.h),
            ),
            child: Text('Select Seats', style: button_text_Style),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
