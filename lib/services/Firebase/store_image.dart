import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/reuseable/Utils/service_error_messages.dart';
import '../../core/reuseable/Widgets/snack_bars.dart';

Future<String?> pickAndUploadImage(Reference storageRef, context) async {
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return null; // User cancelled or failed to pick image
    }

    final imageFile = File(pickedImage.path);

    final uploadTask = storageRef.putFile(imageFile);
    final snapshot = await uploadTask.whenComplete(
        () => Future.delayed(const Duration(seconds: 1))); // Ensure upload completion
    final url = await snapshot.ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    showSnackBar(context, getErrorMessage(e));
    return null;
  } catch (e) {
    showSnackBar(context, getErrorMessage(e));
    return null;
  }
}
