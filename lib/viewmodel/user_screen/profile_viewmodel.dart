import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/reuseable/Widgets/text_sizes.dart';

class SideDrawerViewmodel extends BaseViewModel {
  bool isLightMode = true;
  bool isLoading = false;
  GlobalKey addressKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  String name = '';
  String email = '';
  String phoneNumber = '';
  String id = '';
  String accessToken = '';
  String profilePics =
      'https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png';

  Future<void> onRefreshed() async {
    await initClass();
  }

  switchMode(value) async {
    isLightMode = value;

    notifyListeners();
  }

  pickProfileImage(context) async {}

  onEditInfo(context, bool isImageOnly) async {}

  onDeleteAccount(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.warning,
            color: Colors.red,
            size: 50.sp,
          ),
          title: Text(
            'You are going to delete your account!',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: TextSize.title2),
          ),
          content: Text(
            'You won\'t be able to restore your data',
            style: TextStyle(fontSize: TextSize.caption1),
          ),
          actions: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black)),
                    child: Text('Cancel',
                        style: TextStyle(
                            fontSize: TextSize.caption1, color: Colors.white))),
                const Spacer(),
                ElevatedButton(
                    onPressed: () async {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red)),
                    child: Text('delete',
                        style: TextStyle(
                            fontSize: TextSize.caption1, color: Colors.white))),
              ],
            ),
          ],
        );
      },
    );
  }

  onLogOut(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.logout,
            color: Colors.green,
            size: 50.sp,
          ),
          title: Text(
            'Log out from this account',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: TextSize.title2),
          ),
          content: Text(
            'You are going ot be logged out from this current account',
            style: TextStyle(fontSize: TextSize.caption1),
          ),
          actions: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black)),
                    child: Text('Cancel',
                        style: TextStyle(
                            fontSize: TextSize.caption1, color: Colors.white))),
                const Spacer(),
                ElevatedButton(
                    onPressed: () async {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green)),
                    child: Text('Log out',
                        style: TextStyle(
                            fontSize: TextSize.caption1, color: Colors.white))),
              ],
            ),
          ],
        );
      },
    );
  }

  getInfos() async {}

  initClass() async {
    await getInfos();
  }
}
