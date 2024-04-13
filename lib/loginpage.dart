import 'package:bus_buddy/dashboard/dashboard.dart';
import 'package:bus_buddy/forget_password/forgot_passwordemail.dart';
import 'package:bus_buddy/forget_password/forgot_passwordphone.dart';
import 'package:bus_buddy/main.dart';
import 'package:bus_buddy/signup_screen.dart';
import 'package:bus_buddy/snackbar_extension.dart';
import 'package:bus_buddy/superbase/superbase_service.dart';
//import 'package:bus_buddy/superbase/authenticationnotifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  bool isloading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  // final SupabaseClient supabaseClient = Supabase.instance.client;
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    // fullnamecontroller = TextEditingController();
    //phonenocontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    // fullnamecontroller.dispose();
    super.dispose();
  }

  void signInWithEmail() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      setState(() {
        isloading = true;
      });
      try {
        await supabaseClient.auth.signInWithPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        setState(() {
          isloading = false;
        });
        navigatetodashboard();
      } on AuthException catch (e) {
        context.showSnackbar(message: e.message, backgroundColor: Colors.red);
        setState(() {
          isloading = false;
        });
      } catch (e) {
        context.showSnackbar(
            message: e.toString(), backgroundColor: Colors.red);
        setState(() {
          isloading = false;
        });
      }
    }
  }

  void navigatetodashboard() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => dashboard()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/bus1.png'),
                  height: 200,
                ),
                Text(
                  'Welcome back,',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  'make it work,make it right,make it faster',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isloading) ...[
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                labelText: 'E-mail',
                                hintText: 'E-mail',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint),
                                labelText: 'password',
                                hintText: 'password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.remove_red_eye_sharp))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              if (value.length < 6) {
                                return 'password length must be 6 char or more';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    builder: (context) => Container(
                                          padding: EdgeInsets.all(30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Make selection!',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Select one of the options given below to reset your password.',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Get.to(() =>
                                                      Forgot_password_email());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .mail_outline_rounded,
                                                        size: 60,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'E-Mail',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            'Reset via E-mail Verification.',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Forgot_passwordphone()));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.phone,
                                                        size: 60,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Phone Number',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            'Reset via Phone Verification.',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Text('Forget Password?'),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: isloading
                                  ? null
                                  : signInWithEmail /*{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dashboard()));
                          },*/
                              ,
                              child: Text('Login'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signupscreen()));
                            },
                            child: Text.rich(
                              TextSpan(
                                  text: "Don't have an Account",
                                  children: [
                                    TextSpan(
                                        text: 'Signup',
                                        style: TextStyle(color: Colors.blue))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
