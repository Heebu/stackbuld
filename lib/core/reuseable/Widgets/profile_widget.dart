import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class ProfileIconDrawer extends StatelessWidget {
  const ProfileIconDrawer({
    super.key,
    required this.size,
    required this.iconSize,
    required this.image,
  });

  final double size;
  final double iconSize;
  final String image;

  @override
  Widget build(BuildContext context) {
    return
         image != ''?
         CircleAvatar(
           radius: size,
           backgroundImage: NetworkImage(image),
         )
         :CircleAvatar(
           radius: size,
            child: Center(
              child: Icon(
                Icons.person, size: iconSize.sp,
                      color: MyAppColors().mainColor,

                  ),
            ),
          );
  }
}

class ButtomButtonIcon extends StatelessWidget {
  const ButtomButtonIcon({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      width: MediaQuery.sizeOf(context).width / 8,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }
}
