/*import 'package:bus_buddy/authentication/models/user_model.dart';
import 'package:bus_buddy/authentication/repository/authenticationrepository.dart';
import 'package:bus_buddy/authentication/repository/user_repository.dart';
import 'package:bus_buddy/forget_password/otpemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();
  //textfeild controllers to get the data from textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneno = TextEditingController();

  final userRepo = Get.put(UserRepository());
  //call this function from design & it will do the rest
  void registerUser(String email, String password) {
    //Authenticationrepository.instance
    // .createUserWithEmailAndPassword(email, password);
    String? error = Authenticationrepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const Otpemail());
  }

  void phoneAuthentication(String phoneNo) {
    Authenticationrepository.instance.phoneAuthentication(phoneNo);
  }
}*/
