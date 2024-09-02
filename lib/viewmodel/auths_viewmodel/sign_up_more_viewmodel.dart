import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../Services/Firebase/FirebaseAuths/authentification.dart';
import '../../core/reuseable/Widgets/snack_bars.dart';
import '../../services/Firebase/store_image.dart';

class SignUpMoreViewModel extends BaseViewModel {
  String? selectedLocation;
  String? selectedGender;
  String profileImage = '';
  String userUid = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController whatsAppLinkController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    phoneNumberController.dispose();
    whatsAppNumberController.dispose();
    whatsAppLinkController.dispose();
    super.dispose();
  }

  void locationSelection(value) {
    selectedLocation = value;
    notifyListeners();
  }

  void genderSelection(value) {
    selectedGender = value;
    notifyListeners();
  }

  pickProfileImage(context) async {
    final imageRefPath =
        FirebaseStorage.instance.ref().child('profile_images/$userUid');
    String? uploadLink = await pickAndUploadImage(imageRefPath, context);
    profileImage = uploadLink ?? '';
  }

  moreInforFunction(context) async {
    isLoading = true;
    notifyListeners();
    String phoneNumber = phoneNumberController.text.trim();
    String whatsAppNumber = whatsAppNumberController.text.trim();

    String? location = '';
    location = selectedLocation ?? locationController.text.trim();

    if (phoneNumber.isNotEmpty &&
        whatsAppNumber.isNotEmpty &&
        selectedGender != null &&
        location.isNotEmpty) {
      try {
        String result = await Auths().addMoreInfo(
            phoneNumber, whatsAppNumber, location, selectedGender!);
        if (result == 'success') {
          Navigator.popUntil(context, (route) => route.isFirst == true);
          Navigator.pushReplacementNamed(context, '/user_home');
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
          showSnackBar(context, result);
        }
        isLoading = false;
        notifyListeners();
      } catch (e) {
        showSnackBar(context, e.toString());
        isLoading = false;
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    } else {
      showSnackBar(context, 'Kindly fill in all the fields');
    }
    isLoading = false;
    notifyListeners();
  }
}
