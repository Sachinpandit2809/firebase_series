import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/resources/k_textstyle.dart';
import 'package:firebase_series/resources/num_ext.dart';
import 'package:firebase_series/screens/homepage_screen.dart';
import 'package:firebase_series/utils/utils.dart';
import 'package:firebase_series/widgets/k_textformfield.dart';
import 'package:firebase_series/widgets/round_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  String verificationId;
  OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("OTP Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.heightBox,
            const Text(
              "Verification OTP",
              style: KTextStyle.K_24,
            ),
            const Text("We had sent a code in +91 99349****33"),
            30.heightBox,
            KTextformfield(
                keyboard: TextInputType.number,
                controller: otpController,
                hintText: "otp"),
                        20.heightBox,

            RoundButton(
                title: "Verify OTP",
                onPress: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: otpController.text.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((onValue) {
                      Utils()
                          .toastSuccessMessage("otp verified! Welcome user!");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomepageScreen()));
                    });
                  } catch (e) {
                    Utils().toastErrorMessage("Wrong Otp, try again?");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoginScreen()));
                  }
                })
          ],
        ),
      ),
    );
  }
}
