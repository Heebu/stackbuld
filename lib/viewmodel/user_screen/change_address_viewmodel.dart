import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../core/reuseable/Widgets/snack_bars.dart';

class ChangeAddressViewmodel extends BaseViewModel {
  List<String> myAddress = <String>[];

  getAddress() async {}

  addAddress(context, String address) async {
    if (address.isNotEmpty) {
      myAddress.add(address);

      notifyListeners();
      Navigator.pop(context);
    } else {
      showSnackBar(context, 'Please add an address');
    }
  }

  deleteAddress(index) async {
    myAddress.removeAt(index);
    myAddress = await getAddress();
    notifyListeners();
  }

  editAddress(index) {}
}
