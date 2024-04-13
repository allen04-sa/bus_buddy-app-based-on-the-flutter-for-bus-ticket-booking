import 'package:bus_buddy/dashboard/dashboard.dart';
import 'package:bus_buddy/forget_password/otpemail.dart';
import 'package:bus_buddy/forget_password/otpphone.dart';
import 'package:bus_buddy/loginpage.dart';
import 'package:bus_buddy/main.dart';
import 'package:bus_buddy/snackbar_extension.dart';
import 'package:gotrue/gotrue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bus_buddy/superbase/superbase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<Signupscreen> {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  bool isloading = false;
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passwordcontroller = TextEditingController();
  late TextEditingController fullnamecontroller = TextEditingController();

  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    fullnamecontroller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    fullnamecontroller.dispose();
    super.dispose();
  }

  void signUp() async {
    setState(() {
      isloading = true;
    });
    try {
      await supabaseClient.auth.signUp(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
        data: {
          'username': fullnamecontroller.text.trim().toLowerCase(),
        },
      );
      setState(() {
        isloading = false;
      });
      navigatetologinpage();
    } on AuthException catch (e) {
      context.showSnackbar(message: e.message, backgroundColor: Colors.red);
      setState(() {
        isloading = false;
      });
    } catch (e) {
      context.showSnackbar(message: e.toString(), backgroundColor: Colors.red);
      setState(() {
        isloading = false;
      });
    }
  }

  void navigatetologinpage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const Loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/bus1.png'),
                  height: size.height * 0.2,
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                key: _formkey,
                child: Container(
                  padding: EdgeInsets.symmetric(),
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
                        controller: fullnamecontroller,
                        decoration: InputDecoration(
                            label: Text('Full name'),
                            prefixIcon: Icon(Icons.person_outline_rounded),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "full name is empty";
                          }
                          final isValid =
                              RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(value);
                          if (!isValid) {
                            return '3-24 long with alphanumeric or underscore ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            label: Text('Email'),
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black))),
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
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.fingerprint),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black))),
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
                      ElevatedButton(
                          onPressed: isloading ? null : signUp,
                          child: Text('Sign up'))
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text('OR'),
                TextButton(
                    onPressed: () {
                      navigatetologinpage();
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: 'Already have an Account?'),
                      TextSpan(text: 'Login')
                    ])))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
