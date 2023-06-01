import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'custom_widgets/curved_line_painter.dart';

class BookSeatScreen extends StatelessWidget {
  const BookSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 93.h,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h),
                // color: Colors.red,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: const Color(0xff202C43),
                    size: 25.h,
                  ),
                ),
              ),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "The Kings Man",
                style: title_text_Style,
              ),
              Text(
                'March 05 2021 | 12:30 Hall 1',
                style: genre_text_Style.copyWith(
                    color: AppColors.light_blue, letterSpacing: 1),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(color: AppColors.lighter_grey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(),
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: InvertedCurvedLinePainter(),
                      size: Size(337.w, 70.h),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: Text(
                          'SCREEN',
                          style: details_overview_text_Style,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230.h,
                margin: EdgeInsets.only(left: 10.w),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        10,
                        (index) => Container(
                          // margin: EdgeInsets.only(bottom: 10.w),
                          child: Text(
                            '${index + 1}',
                            style: genre_text_Style.copyWith(
                              fontSize: 7.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        10,
                        (index1) => Container(
                          margin: index1 != 9
                              ? EdgeInsets.only(bottom: 10.w)
                              : const EdgeInsets.only(bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5.w),
                                          child: Icon(
                                            Icons.monitor_rounded,
                                            size: 11.h,
                                            color: index1 % 9 != 0
                                                ? index % 6 == 0
                                                    ? AppColors.light_blue
                                                    : AppColors.light_grey
                                                : AppColors.purpleColor,
                                          ),
                                        ),
                                      ],
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        10,
                        (index1) => Container(
                          margin: index1 != 9
                              ? EdgeInsets.only(bottom: 10.w)
                              : const EdgeInsets.only(bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                10,
                                (index) => Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      child: Icon(
                                        Icons.monitor,
                                        size: 11.h,
                                        color: index % 3 == 0
                                            ? index % 6 == 0
                                                ? AppColors.light_blue
                                                : AppColors.light_grey
                                            : Colors.lightBlue,
                                      ),
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        10,
                        (index1) => Container(
                          margin: index1 != 9
                              ? EdgeInsets.only(bottom: 10.w)
                              : const EdgeInsets.only(bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Icon(
                                  Icons.monitor,
                                  size: 11.h,
                                  color: index1 % 9 != 0
                                      ? index % 6 == 0
                                          ? AppColors.light_blue
                                          : AppColors.light_grey
                                      : AppColors.purpleColor,
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
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 252.h,
          padding: EdgeInsets.only(bottom: 23.h, right: 26.w),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 27.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.monitor,
                            fill: 1,
                            color: AppColors.yellowColor,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            "Selected",
                            style: details_overview_text_Style,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.monitor,
                            fill: 1,
                            color: AppColors.purpleColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "VIP (\$ 120)",
                            style: details_overview_text_Style,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.monitor,
                            fill: 1,
                            color: AppColors.light_grey,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            "Not available",
                            style: details_overview_text_Style,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.monitor,
                            fill: 1,
                            color: AppColors.light_blue,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Regular",
                            style: details_overview_text_Style,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: AppColors.light_grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "4/",
                      style: details_genre_text_Style.copyWith(
                          color: Colors.black),
                    ),
                    Text(
                      " 3 Row",
                      style: details_overview_text_Style,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.close,
                      size: 15.h,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.light_grey.withOpacity(0.3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      fixedSize: Size(108.w, 50.h),
                      minimumSize: Size(108.w, 50.h),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FittedBox(
                          child: Text(
                            'Total Price',
                            style: details_overview_text_Style.copyWith(
                                color: Colors.black),
                          ),
                        ),
                        AutoSizeText(
                          '\$ 50',
                          style: button_text_Style.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontFamily: 'Poppins Bold'),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.light_blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      fixedSize: Size(216.w, 50.h),
                      // maximumSize: const Size(222, 222),
                    ),
                    child: Text('Proceed to pay', style: button_text_Style),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
