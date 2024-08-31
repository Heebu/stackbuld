import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(children: [
            SizedBox(
              height: 100.h,
              child: PageView.builder(
                itemBuilder: (context, index) => Container(color: Colors.pink),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Shop by cartegories'),
                      TextButton(onPressed: () {}, child: const Text('see all'))
                    ],
                  ),
                  SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            CircleAvatar(
                              radius: 40.r,
                            ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Shop by categories'),
                      TextButton(onPressed: () {}, child: const Text('see all'))
                    ],
                  ),
                  SizedBox(
                      height: 150.h,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Container(
                            width: 100,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 100.h,
                                    child: Stack(children: [
                                      Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                                image: DecorationImage(
                                                    image: NetworkImage(''))),
                                          )),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {},
                                              icon:
                                              Icon(Icons.favorite_border)))
                                    ]))
                              ],
                            ));
                      })),
                ],
              ),
            ),
          ]),
        ));
  }
}
