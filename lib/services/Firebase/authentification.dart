import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auths {
  //sign in
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    String result = 'An unexpected error occurred';

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential users = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        // Send a verification email to the user
        if (auth.currentUser!.emailVerified == false) {
          result = 'Please go to your mail to verify your mail account';
        }
        // Check if the email has been verified
        result = 'success';
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        result = getErrorMessage(e);
      } catch (e) {
        result = getErrorMessage(e);
      }
    }
    return result;
  }

  //sign up
  Future<String> signUp(String email, String password) async {
    String result = 'An unexpected error occurred';

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential users = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
        // Send a verification email to the user
        await users.user?.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        result = getErrorMessage(e);
      } catch (e) {
        result = getErrorMessage(e);
      }
    }
    return result;
  }


  Future<String> addCredInfo(
      String firstName,
      String lastName,
      String email,
      String password,
      ) async {
    String result = 'An unexpected error occurred';
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('Users');
    try {
      final User? user = FirebaseAuth.instance.currentUser;

        final String uid = user!.uid;
        await usersCollection.doc(uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'uid': uid,
          'time': DateTime.now(),
        });

    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  //additional info
  Future<String> addMoreInfo(
    String phoneNumber,
    String whatsappNumber,
    String student,
    String occupation,
    String level,
    String location,
    String collage,
    String matricNumber,
    String sex,
  ) async {
    String result = 'An unexpected error occurred';
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final String uid = user.uid;
       if(occupation == 'Student'){
         await usersCollection.doc(uid).update({
           'phoneNumber': phoneNumber,
           'profilePicture': 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541',
           'whatsAppNumber': whatsappNumber,
           'location': location,
           'school': 'FUNAAB',
           'studentType': student,
           'matricNumber': matricNumber,
           'level': level,
           'occupation': occupation,
           'collage': collage,
           'gender': sex,
         });
       } else{
         await usersCollection.doc(uid).update({
           'phoneNumber': phoneNumber,
           'profilePicture': '',
           'whatsAppNumber': whatsappNumber,
           'location': location,
           'school': 'FUNAAB',
           'occupation': occupation,
           'gender': sex,
         });
       }
        result = 'success';
        bool isVerified = user.emailVerified;
        // If the email is not verified, show an error message
        if (!isVerified) {
          result = 'Please click the link in your email to verify your account';
        }
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  // forgot password
  Future<String> forgotPassword(String email) async {
    String result = '';
    try {
      await auth.sendPasswordResetEmail(email: email);
      result = 'success';
    } catch (e) {
     result =  getErrorMessage(e);
    }
    return result;
  }

  //log out
  Future<String> logOut() async {
    String result = '';
    try {
      await auth.signOut();
      result = 'success';
    } catch (e) {
      getErrorMessage(e);
    }
    return result;
  }

  //delete account
  Future<String> deleteAccount(String password) async {
    String result = '';
    String? email = auth.currentUser?.email;
    try {
      String signInResult = await signIn(email!, password);
      if (signInResult == 'success') {
        await auth.currentUser?.delete();
        result = 'success';
      } else {
        result = signInResult;
      }
    } catch (e) {
      getErrorMessage(e);
    }
    return result;
  }

  //resend verification link

  Future<String> resendVerfLink() async {
    String result = 'An unexpected error occurred';
    try {
      // Ensure there's a current user
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        result = 'success';
      }
    } catch (e) {
      result = getErrorMessage(e);
    }
    return result;
  }

// error messages
  String getErrorMessage(e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        return 'User not found. Please check your email';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password';
      } else if (e.code == 'network-request-failed') {
        return 'Network request failed. Please check your internet connection';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address';
      } else if (e.code == 'weak-password') {
        return 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The email address is already in use';
      }
      return 'Firebase error: ${e.code}';
    }
    return 'An unexpected error occurred';
  }
}
