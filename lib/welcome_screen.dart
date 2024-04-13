import 'package:bus_buddy/loginpage.dart';
import 'package:bus_buddy/signup_screen.dart';
import 'package:flutter/material.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 206, 59),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/bus1.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome To u r app!!!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                    style: OutlinedButton.styleFrom(
                        elevation: 5,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black),
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signupscreen()));
                        },
                        style: OutlinedButton.styleFrom(
                            elevation: 5,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white),
                        child: Text('Sign up')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
