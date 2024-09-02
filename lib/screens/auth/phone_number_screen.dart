import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/auth/otp_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Phone Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "Enter Phone Number",
              style: KTextStyle.K_20,
            ),
                       30.heightBox,

            KTextformfield(
                keyboard: TextInputType.number,
                controller: phoneController,
                hintText: "phone"),
                       20.heightBox,

            RoundButton(
                title: "request OTP",
                onPress: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "+91${phoneController.text}",
                      verificationCompleted: (PhoneAuthCredential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendTocken) {
                        Utils().toastSuccessMessage(
                            "otp sent to ${phoneController.text}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                      verificationId: verificationId,
                                    )));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {});
                })
          ],
        ),
      ),
    );
  }
}
