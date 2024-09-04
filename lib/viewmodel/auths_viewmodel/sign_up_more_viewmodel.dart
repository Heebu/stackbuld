import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SignUpMoreViewModel extends BaseViewModel {
  String? selectedLocation;
  String? selectedGender;
  String profileImage = '';

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
    String uploadLink = '';
    profileImage = uploadLink;
  }

  moreInforFunction(context) async {
    isLoading = true;
    notifyListeners();
    Navigator.popUntil(context, (route) => route.isFirst == true);
    Navigator.pushReplacementNamed(context, '/main_page_view');

    isLoading = false;
    notifyListeners();
  }
}
