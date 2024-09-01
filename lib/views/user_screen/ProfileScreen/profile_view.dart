import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/reuseable/Widgets/mainTextWidget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'profile image',
                child: MaterialButton(
                  onPressed: () {
                    // viewModel.pickProfileImage(context);
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('viewModel.profilePics'),
                            fit: BoxFit.cover),
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(width: 3.w)),
                  ),
                ),
              ),
            ),
            Center(
              child: Text1(
                text: 'viewModel.name',
              ),
            ),
            Center(
              child: Text3(
                text: 'viewModel.email',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text1(
              text: 'Profile',
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.edit),
              title: Text2(
                text: 'Personal Information',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const ChangeAddressView(),
                //     ));
              },
              leading: const Icon(Icons.location_history),
              title: Text2(
                text: 'Change Location Address',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionHistoryViewmodel(),));
              },
              leading: const Icon(Icons.history_toggle_off),
              title: Text2(
                text: 'Transaction history',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            ListTile(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const CompletePurchaseView(),));
                },
                leading: const Icon(Icons.sell_sharp),
                title: Text2(
                  text: 'Complete purchase',
                )),
            const Divider(),
            Text1(
              text: 'Legal',
            ),
            ListTile(
              onTap: () {
                //
              },
              leading: const Icon(Icons.help),
              title: Text2(
                text: 'Help & Support',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            ListTile(
              onTap: () {},
              leading: const Icon(Icons.question_answer),
              title: Text2(
                text: 'Terms and conditions',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.info),
              title: Text2(
                text: 'Privacy policy',
              ),
            ),

            //logout
            const Divider(),
            SizedBox(
              height: 20.h,
            ),
            Text1(
              text: 'General',
            ),

            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.logout,
                color: Colors.red,
                size: 13.sp,
              ),
              title: Text2(
                text: 'Log out',
              ),
            ),
            //delete account
            const Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 13.sp,
              ),
              title: Text2(
                text: 'Delete Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
