import 'package:firebase_auth/firebase_auth.dart';

String getErrorMessage(e) {
  try {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return 'User not found. Please check your email';
        case 'wrong-password':
          return 'Incorrect password';
        case 'network-request-failed':
          return 'Network request failed. Please check your internet connection';
        case 'invalid-email':
          return 'Invalid email address';
        case 'user-disabled':
          return 'User account has been disabled';
        case 'too-many-requests':
          return 'Too many requests. Please try again later';
        case 'operation-not-allowed':
          return 'This operation is not allowed';
        case 'email-already-in-use':
          return 'The email address is already in use by another account';
        case 'requires-recent-login':
          return 'Please re-authenticate to perform this action';
        // Add more Firebase Auth errors as needed
        default:
          return 'Firebase Authentication error: ${e.code}';
      }
    } else if (e is FirebaseException) {
      switch (e.code) {
        case 'object-not-found':
          return 'File not found';
        case 'bucket-not-found':
          return 'Storage bucket not found';
        case 'project-not-found':
          return 'Firebase project not configured for Storage';
        case 'unauthorized':
          return 'User is not authorized to perform the action';
        case 'retry-limit-exceeded':
          return 'Maximum retry attempts exceeded';
        case 'invalid-checksum':
          return 'File integrity check failed';
        case 'canceled':
          return 'Operation was canceled';
        case 'quota-exceeded':
          return 'Storage quota exceeded';
        case 'unauthenticated':
          return 'User is unauthenticated';
        case 'object-not-found':
          return 'File not found. Please check the file path or reference.';
        case 'bucket-not-found':
          return 'Storage bucket not found. Please configure your Storage project correctly.';
        case 'project-not-found':
          return 'Firebase project not configured for Storage. Ensure your project is set up correctly.';
        case 'unauthorized':
          return 'You are not authorized to perform this action. Check your authentication rules and user permissions.';
        case 'retry-limit-exceeded':
          return 'Too many requests have been made. Please try again later or contact support if the issue persists.';
        case 'invalid-checksum':
          return 'File integrity check failed. The uploaded file may be corrupted. Please try again with a different file.';
        case 'canceled':
          return 'The upload operation was canceled.';
        case 'quota-exceeded':
          return 'Storage quota exceeded. Upgrade your storage plan or delete unnecessary files.';
        case 'unauthenticated':
          return 'You are not authenticated. Please authenticate the user before performing this action.';
        case 'permission-denied':
          return 'Insufficient permissions to access the file or bucket. Verify your security rules and user access levels.';
        // Add more Firebase Storage errors as needed
        default:
          return 'Firebase Storage error: ${e.code}';
      }
    } else {
      return 'An unexpected error occurred: $e';
    }
  } on Exception catch (e) {
    return 'An unexpected error occurred: $e'; // Catch any other errors
  }
}
