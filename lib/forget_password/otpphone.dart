import 'package:bus_buddy/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Otpphone extends StatelessWidget {
  const Otpphone({super.key});

  @override
  Widget build(BuildContext context) {
    // var otpController = Get.put(OTPcontroller());
    var otp;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CO\nDE',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 80),
              ),
              Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Enter the verification code sent at\n' + '+91 9993882939',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              OTPTextField(
                length: 6,
                width: double.infinity,
                fieldWidth: 60,
                style: TextStyle(fontSize: 15),
                textFieldAlignment: MainAxisAlignment.center,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  otp = pin;
                  // OTPcontroller.instance.verifyOTP(otp);
                  print('completed:' + pin);
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => dashboard()));*/
                    // OTPcontroller.instance.verifyOTP(otp);
                  },
                  child: Text('submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
