
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});
  static String verify = "";
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(

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

                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),

                        SizedBox(
                          width: 40,
                          child:TextField(
                            controller: countrycode,
                            decoration: InputDecoration(border: InputBorder.none),
                          ),
                        ),

                        Text("|" ,style: TextStyle(fontSize: 33,color: Colors.grey),),
                        SizedBox(width: 10,),
                        Expanded(
                          child:TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value){
                              phone = value;
                            },
                            decoration: InputDecoration(border: InputBorder.none,hintText: 'Phone number'),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                      height: 45,
                     width: double.infinity,

                     child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${countrycode.text + phone}',
                            verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {
                              MyPhone.verify = verificationId;
                              Navigator.pushNamed(context, "otp");
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );
                          // Navigator.pushNamed(context, "otp");
                        },
                        child: Text(
                          'Send the Code',
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

                ],
              ),
            ),

          ),
        )
    );
  }
}
