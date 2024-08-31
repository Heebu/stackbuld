import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/ui_sizes.dart';
import 'mainTextWidget.dart';

class FeedsHighLights extends StatelessWidget {
  const FeedsHighLights({
    super.key,
    required this.headlines,
    required this.newsPreview,

    required this.image, required this.likes,
    required this.dislikes,
    required this.views,
  });

  final String headlines;
  final String newsPreview;
  final String image;
  final String likes;
  final String dislikes;
  final String views;

  @override
  Widget build(BuildContext context) {
    String newHeadLine = headlines;
    String newNewsPreview = newsPreview;

    if (headlines.length >35) {
      newHeadLine = headlines.replaceRange(29, headlines.length, '...');
    }
    if (newsPreview.length > 150) {
      newNewsPreview = newsPreview.replaceRange(99, newsPreview.length, '...');
    }

    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyTextSizes().normalBorder),
        color: Colors.grey.shade100,
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 130.w,
            height: 110.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MyTextSizes().normalBorder),
                color: MyAppColors().imageLoadingColor,
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                margin: EdgeInsets.symmetric(vertical: 2.h),

                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MainTextWidget(text: headlines,),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                margin: EdgeInsets.symmetric(vertical: 2.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    newNewsPreview,
                    style: TextStyle(
                      fontSize: MyTextSizes().textSize3,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                margin: EdgeInsets.symmetric(vertical: 2.h),
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up, size: 20.sp,),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 5.w),
                            child: MainTextWidget(text: likes),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.thumb_down, size: 20.sp,),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 5.w),
                            child: MainTextWidget(text: dislikes),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, size: 20.sp,),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 5.w),
                            child: MainTextWidget(text: views),
                          ),
                        ],
                      ),
                    ],),

              ),
            ],
          )
        ],
      ),
    );
  }
}
