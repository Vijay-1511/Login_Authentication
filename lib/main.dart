
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saksham_login/home.dart';
import 'package:saksham_login/phone.dart';

import 'otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyDGJIR5Zh1e8lZOAL_w_dRnNYl305SjouM",
      appId: "1:933830661079:android:89e00dd451da8290c1b192",
      messagingSenderId: "933830661079",
      projectId: "saksham-login",
    ),
  );


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {'phone':(context) => MyPhone(),
      'otp': (context) => MyOtp(),
      'home': (context) => MyHome()
    },
  ));
}
// void _verifyPhoneNumber() async {
//   setState(() {
//     isLoading = true; // Set isLoading to true when the button is pressed
//   });
//   String phoneNumber = '+91' + phoneNumberController.text.trim();
//
//   // Perform phone number validation if needed
//   if (phoneNumber.length != 13) {
//     // Show an error message or handle the invalid phone number
//     print('Invalid phone number. Please enter a 10-digit number.');
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Invalid phone number'),
//       ),
//     );
//     return;
//   }
//
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       // Auto-retrieve the SMS code on Android
//       // await FirebaseAuth.instance.signInWithCredential(credential);
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       // Handle verification failed
//       print('Verification Failed: ${e.message}');
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       // Navigate to OTP screen with verificationId
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => OtpOneScreen(
//               verificationId: verificationId, phoneNumber: phoneNumber),
//         ),
//       );
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       // Handle code auto-retrieval timeout
//       setState(() {
//         isLoading =
//         false; // Set isLoading to false when the process is complete
//       });
//     },
//   );
// }
//
// void setState(Null Function() param0) {
// }
