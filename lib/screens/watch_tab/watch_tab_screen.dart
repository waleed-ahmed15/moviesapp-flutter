import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/screens/home/widgets/text_icon_row.dart';
import 'package:moviesapp/utils/app_colors.dart';

class WatchTabScreen extends StatelessWidget {
  const WatchTabScreen({super.key});

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
            child: Container(
              color: AppColors.lighter_grey,
            ),
          ),
        ],
      ),
    );
  }
}
