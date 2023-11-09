import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();

  //local Storage privat fields
  final _userStorage = GetStorage('GameUsers');
  final _storageKey = 'userList';
  //public fields Observable
  final szUserName = 'User Page'.obs;
  final TextEditingController userNameController = TextEditingController();
  final userList = <String>[].obs;

  @override
  void onInit() {
    loadUsers();
    super.onInit();
  }

  void loadUsers() {
    if (_userStorage.hasData(_storageKey)) {
      var result = _userStorage.read(_storageKey);
      for (var userItem in result) {
        userList.add(userItem.toString());
      }
    }
    update();
  }

  bool isListOfUserExists() {
    if (!_userStorage.hasData(_storageKey)) {
      Get.snackbar(
        'User List',
        'Save User before continue !',
        backgroundColor: Colors.green.shade300,
        colorText: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }

  void addAUser() {
    if (userNameController.text == '') {
      Get.snackbar('User', 'Please insert a Username');
    } else {
      userList.add(userNameController.text);
      userNameController.clear();
    }

    update();
  }

  void saveUsers() {
    if (userList.isEmpty) {
      Get.snackbar('User List', 'The User List is empty!');
    } else {
      if (_userStorage.hasData(_storageKey)) {
        _userStorage.remove(_storageKey);
      }
      _userStorage.write(_storageKey, userList);
      Get.snackbar(
        'UsersList',
        'All Users saved!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  void deleteAUser(int index) {
    if (_userStorage.hasData(_storageKey)) {
      _userStorage.remove(_storageKey);
    }
    userList.removeAt(index);
    update();
  }

  void deleteAllUsersInList() {
    if (_userStorage.hasData(_storageKey)) {
      _userStorage.remove(_storageKey);
    }
    userList.clear();
  }
}
