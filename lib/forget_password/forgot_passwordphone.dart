import 'package:bus_buddy/forget_password/otpphone.dart';
import 'package:flutter/material.dart';

class Forgot_passwordphone extends StatelessWidget {
  const Forgot_passwordphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage('assets/images/forget.png'),
                height: 100,
                alignment: Alignment.topCenter,
              ),
              Text(
                'Forgot Password',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Select one of the options given below to reset your password.',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Phone Number'),
                      hintText: 'phone number',
                      prefixIcon: Icon(Icons.phone_iphone_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Otpphone()));
                        },
                        child: Text('Next'),
                      )),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
