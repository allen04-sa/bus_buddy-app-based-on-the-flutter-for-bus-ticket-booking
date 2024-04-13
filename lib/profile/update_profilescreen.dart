import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void saveProfileDetails() {
    String updatedName = nameController.text;
    String updatedEmail = emailController.text;

    // Pass the updated details back to the ProfilePage
    Navigator.pop(context, {'name': updatedName, 'email': updatedEmail});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProfileDetails,
              child: Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}/*
import 'package:bus_buddy/authentication/models/user_model.dart';
import 'package:bus_buddy/profile/profilepage.dart';
import 'package:bus_buddy/profile/widgets/profile_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  // UserModel get user => null;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Redirect to the dashboard page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  //contollers
                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: AssetImage('assets/images/profile.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(255, 108, 130, 147)
                                    .withOpacity(0.1),
                              ),
                              child: Icon(
                                Icons.camera,
                                color: const Color.fromARGB(255, 116, 131, 156),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              //  initialValue: userData.fullName,
                              controller: fullName,
                              decoration: InputDecoration(
                                  label: Text('Full name'),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded),
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // initialValue: userData.email,
                              controller: email,
                              decoration: InputDecoration(
                                  label: Text('Email'),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //initialValue: userData.phoneNo,
                              controller: phoneNo,
                              decoration: InputDecoration(
                                  label: Text('Phone no'),
                                  prefixIcon: Icon(Icons.numbers),
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //initialValue: userData.password,
                              controller: password,
                              decoration: InputDecoration(
                                  label: Text('Password'),
                                  prefixIcon: Icon(Icons.fingerprint),
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                        email: email.text.trim(),
                                        fullName: fullName.text.trim(),
                                        password: password.text.trim(),
                                        phoneNo: phoneNo.text.trim());

                                    await controller.updateRecord(user);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text('Edit profile')),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Joined',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none),
                                    child: const Text('Delete'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // future:null;
            },
            //future: null,
          ),
        ),
      ),
    );
  }
}
*/