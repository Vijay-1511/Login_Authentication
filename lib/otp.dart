import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:saksham_login/phone.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  get defaultPinTheme => null;

  get focusedPinTheme => null;

  get submittedPinTheme => null;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new
          ),
        ),
      ),

        body: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          color: Colors.white,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/saksham_images.png',
                      width: 150,
                      height:  150,
                      alignment: Alignment.center
                  ),
                  SizedBox(height: 10),




                  Text(
                    'Phone Number Verification',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'You need to Register your Mobile number',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20,),
                  // Container(
                  //   height: 55,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1,color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(width: 10,),
                  //
                  //       SizedBox(
                  //         width: 40,
                  //         child:TextField(
                  //           decoration: InputDecoration(border: InputBorder.none),
                  //         ),
                  //       ),
                  //
                  //       Text("|" ,style: TextStyle(fontSize: 33,color: Colors.grey),),
                  //       SizedBox(width: 10,),
                  //       Expanded(
                  //         child:TextField(
                  //           decoration: InputDecoration(border: InputBorder.none,hintText: 'Phone number'),
                  //         ),
                  //       )
                  //
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value){
                    code = value;
                  },

                ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 45,
                      width: double.infinity,

                      child: ElevatedButton(
                        onPressed: () async {
                          try{
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);

                            // Sign the user in (or link) with the credential
                            await auth.signInWithCredential(credential);
                            Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
                          }
                          catch(e){
                             print("wrong otp");
                          }

                        },
                        child: Text(
                          'Verify phone number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      )

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: (){
                               Navigator.pushNamedAndRemoveUntil(context,'phone', (route) => false);
                          },

                          child: Text("Edit Phone number ?",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ),
        )
    );
  }
}
