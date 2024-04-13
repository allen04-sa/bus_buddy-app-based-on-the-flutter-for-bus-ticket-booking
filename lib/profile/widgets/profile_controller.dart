/*import 'package:bus_buddy/authentication/models/user_model.dart';
import 'package:bus_buddy/authentication/repository/authenticationrepository.dart';
import 'package:bus_buddy/authentication/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Repositories
  final _authRepo = Get.put(Authenticationrepository());
  final _userRepo = Get.put(UserRepository());
  //step 3 get user email and pass to the userrepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

//fetch list of user records
  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
*/