import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../helper/data_source.dart';
import '../helper/constants.dart';
import '../models/game_model.dart';

class GameController extends GetxController {
  static GameController get to => Get.find<GameController>();

  //public fields
  final _userStorage = GetStorage('GameUsers');
  final _storageKey = 'userList';
  final userList = <String>[].obs;

  final _dataStorage = GetStorage('GameData');
  final _dataStorageKey = 'dataList';

  final gameMapList = <dynamic>[].obs;

  final errorList = <GameModel>[];
  //selected Drop Down User
  final dropDownSelectedUserName = ''.obs;
  //summe alles
  final mnSummePerUser = 0.obs;
  final mnSummAllSkittles = 0.obs;
  //input controllers
  final firstSkittleNumber = TextEditingController();
  final secondSkittleNumber = TextEditingController();
  final thirdSkittleNumber = TextEditingController();
  final fourthSkittleNumber = TextEditingController();
  final fiveSkittleNumber = TextEditingController();
  final sixSkittleNumber = TextEditingController();
  final sevenSkittleNumber = TextEditingController();
  final eightSkittleNumber = TextEditingController();
  // sum per skittle
  final firstSum = 0.obs;
  final secondSum = 0.obs;
  final thirdSum = 0.obs;
  final fourthSum = 0.obs;

  @override
  void onInit() async {
    loadUsers();
    loadStorageData();
    super.onInit();
  }

  void loadUsers() {
    if (_userStorage.hasData(_storageKey)) {
      var result = _userStorage.read(_storageKey);
      for (var userItem in result) {
        userList.add(userItem.toString());
      }
      if (userList.isNotEmpty) {
        myUsersDropDown();
      }
    }
    if (StaticClassData.staticGameList.isNotEmpty) {
      gameMapList.value = StaticClassData.staticGameList;
    }
    update();
  }

  void loadStorageData() {
    if (_dataStorage.hasData(_dataStorageKey)) {
      gameMapList.value = _dataStorage.read(_dataStorageKey) ?? [];
      StaticClassData.staticGameList = gameMapList;
      _displayStorageData();
    }
    update();
  }

  @override
  void onClose() {
    firstSkittleNumber.dispose();
    secondSkittleNumber.dispose();
    thirdSkittleNumber.dispose;
    fourthSkittleNumber.dispose();
    fiveSkittleNumber.dispose();
    sixSkittleNumber.dispose();
    sevenSkittleNumber.dispose();
    eightSkittleNumber.dispose();
    super.onClose();
  }

  //clear text Input fields
  void clearTextEditingFields() {
    firstSkittleNumber.clear();
    secondSkittleNumber.clear();
    thirdSkittleNumber.clear();
    fourthSkittleNumber.clear();
    fiveSkittleNumber.clear();
    sixSkittleNumber.clear();
    sevenSkittleNumber.clear();
    eightSkittleNumber.clear();
  }

  void saveScoreBoardInList() async {
    bool displayError = false;
    //save local Storage
    List<GameModel> myGameModelToSave = [];
    for (var element in gameMapList) {
      var itemModel = GameModel.fromMap(element);
      myGameModelToSave.add(itemModel);
    }
    //myGameModelToSave.sort(((a, b) => a.run.compareTo(b.run)));
    //save data Notion
    for (var e in myGameModelToSave) {
      if (!await DataSourceNotion.saveOverAPIService(
        e.userName,
        e.run,
        e.first,
        e.second,
        e.third,
        e.fourth,
        e.five,
        e.six,
        e.seven,
        e.eight,
      )) {
        errorList.add(e);
        displayError = true;
      }
    }
    if (displayError) {
      Get.defaultDialog(
        title: 'Fehler API-Rest Service',
        middleText: 'Error list with not saved Elements',
        radius: 10,
        textCancel: 'Cancel',
        barrierDismissible: false,
        content: Container(
          width: 200,
          height: 250,
          decoration: const BoxDecoration(color: Colors.green),
          child: errorList.isNotEmpty
              ? ListView.builder(
                  itemCount: errorList.length,
                  itemBuilder: ((context, index) =>
                      Text(errorList[index].userName)),
                )
              : const Text('No Errors!'),
        ),
      );
    } else {
      Get.snackbar(
        'Save to API',
        'Data is saved!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    //clearData
    firstSum.value = 0;
    secondSum.value = 0;
    thirdSum.value = 0;
    fourthSum.value = 0;
    mnSummAllSkittles.value = 0;
    gameMapList.clear();
    StaticClassData.staticGameList.clear();
    update();
  }

  Map<String, dynamic> oneItemSkittle(String witchRun) {
//one Item for List
    return {
      "userName": dropDownSelectedUserName.value,
      "run": witchRun,
      "first":
          firstSkittleNumber.text.isNotEmpty ? firstSkittleNumber.text : "",
      "second":
          secondSkittleNumber.text.isNotEmpty ? secondSkittleNumber.text : "",
      "third":
          thirdSkittleNumber.text.isNotEmpty ? thirdSkittleNumber.text : "",
      "fourth":
          fourthSkittleNumber.text.isNotEmpty ? fourthSkittleNumber.text : "",
      "fives": fiveSkittleNumber.text.isNotEmpty ? fiveSkittleNumber.text : "",
      "six": sixSkittleNumber.text.isNotEmpty ? sixSkittleNumber.text : "",
      "seven":
          sevenSkittleNumber.text.isNotEmpty ? sevenSkittleNumber.text : "",
      "eight": eightSkittleNumber.text.isNotEmpty ? eightSkittleNumber.text : ""
    };
  }

  void _calcSumPerRound(Map currentRun) {
    //get data
    int sk01 = currentRun['first'] != '' ? int.parse(currentRun['first']) : 0;
    int sk02 = currentRun['second'] != '' ? int.parse(currentRun['second']) : 0;
    int sk03 = currentRun['third'] != '' ? int.parse(currentRun['third']) : 0;
    int sk04 = currentRun['fourth'] != '' ? int.parse(currentRun['fourth']) : 0;
    int sk05 = currentRun['fives'] != '' ? int.parse(currentRun['fives']) : 0;
    int sk06 = currentRun['six'] != '' ? int.parse(currentRun['six']) : 0;
    int sk07 = currentRun['seven'] != '' ? int.parse(currentRun['seven']) : 0;
    int sk08 = currentRun['eight'] != '' ? int.parse(currentRun['eight']) : 0;
    //calc sum
    int sum = sk01 + sk02 + sk03 + sk04 + sk05 + sk06 + sk07 + sk08;
    //assign
    if (currentRun['run'] == 'A') {
      firstSum.value = sum;
    }
    if (currentRun['run'] == 'B') {
      secondSum.value = sum;
    }
    if (currentRun['run'] == 'C') {
      thirdSum.value = sum;
    }
    if (currentRun['run'] == 'D') {
      fourthSum.value = sum;
    }
  }

//add litter Sum
  void addLitterSum() {
    mnSummePerUser.value = 0;
    int first = int.tryParse(firstSkittleNumber.text) != null
        ? int.parse(firstSkittleNumber.text)
        : 0;
    int second = secondSkittleNumber.text != ''
        ? int.parse(secondSkittleNumber.text)
        : 0;
    int third =
        thirdSkittleNumber.text != '' ? int.parse(thirdSkittleNumber.text) : 0;
    int fourth = fourthSkittleNumber.text != ''
        ? int.parse(fourthSkittleNumber.text)
        : 0;
    int five =
        fiveSkittleNumber.text != '' ? int.parse(fiveSkittleNumber.text) : 0;
    int six =
        sixSkittleNumber.text != '' ? int.parse(sixSkittleNumber.text) : 0;
    int seven =
        sevenSkittleNumber.text != '' ? int.parse(sevenSkittleNumber.text) : 0;
    int eight =
        eightSkittleNumber.text != '' ? int.parse(eightSkittleNumber.text) : 0;
    mnSummePerUser.value =
        first + second + third + fourth + five + six + seven + eight;
    update();
  }

  // load Skittel Data from list
  void _displayStorageData() {
    firstSum.value = 0;
    secondSum.value = 0;
    thirdSum.value = 0;
    fourthSum.value = 0;
    if (gameMapList.isNotEmpty && dropDownSelectedUserName.isNotEmpty) {
      var firstRun = gameMapList.firstWhereOrNull((e) =>
          (e['userName'] == dropDownSelectedUserName.value) && e['run'] == 'A');
      if (firstRun != null) {
        _calcSumPerRound(firstRun);
      }
      var secondRun = gameMapList.firstWhereOrNull((e) =>
          (e['userName'] == dropDownSelectedUserName.value) && e['run'] == 'B');
      if (secondRun != null) {
        _calcSumPerRound(secondRun);
      }
      var thirdRun = gameMapList.firstWhereOrNull((e) =>
          (e['userName'] == dropDownSelectedUserName.value) && e['run'] == 'C');
      if (thirdRun != null) {
        _calcSumPerRound(thirdRun);
      }
      var fourthRun = gameMapList.firstWhereOrNull((e) =>
          (e['userName'] == dropDownSelectedUserName.value) && e['run'] == 'D');
      if (fourthRun != null) {
        _calcSumPerRound(fourthRun);
      }
      mnSummAllSkittles.value =
          firstSum.value + secondSum.value + thirdSum.value + fourthSum.value;
    }
    update();
  }

  //save sum of 8 Skittle to List
  void addSumOfFourSkittles(String switchEx) {
    mnSummAllSkittles.value = 0;
    if (dropDownSelectedUserName.isEmpty) {
      Get.snackbar(
        'User',
        'No User selected!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      switch (switchEx) {
        case 'first':
          firstSum.value = 0;
          addLitterSum();
          firstSum.value = mnSummePerUser.value;
          gameMapList.add(oneItemSkittle('A'));
          break;
        case 'second':
          secondSum.value = 0;
          addLitterSum();
          secondSum.value = mnSummePerUser.value;
          gameMapList.add(oneItemSkittle('B'));
          break;
        case 'third':
          thirdSum.value = 0;
          addLitterSum();
          thirdSum.value = mnSummePerUser.value;
          gameMapList.add(oneItemSkittle('C'));
          break;
        case 'fourth':
          fourthSum.value = 0;
          addLitterSum();
          fourthSum.value = mnSummePerUser.value;
          gameMapList.add(oneItemSkittle('D'));
          break;
        default:
      }
      mnSummAllSkittles.value =
          firstSum.value + secondSum.value + thirdSum.value + fourthSum.value;
      clearTextEditingFields();
      mnSummePerUser.value = 0;
      _dataStorage.write(_dataStorageKey, gameMapList);
      StaticClassData.staticGameList = gameMapList;
    }
    update();
  }

  DropdownButtonFormField myUsersDropDown() {
    // ignore: prefer_typing_uninitialized_variables
    var selectedValue;
    return DropdownButtonFormField(
      value: selectedValue,
      items: userList
          .map(
            (userName) => DropdownMenuItem(
              value: userName,
              child: Text(
                userName,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          )
          .toList(),
      onChanged: (newValue) {
        dropDownSelectedUserName.value = newValue.toString();
        _displayStorageData();
      },
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 25),
        hintText: 'Users',
        contentPadding: const EdgeInsets.all(5),
        filled: true,
        fillColor: Colors.grey.shade300,
      ),
    );
  }

  checkInput(String value) {
    if (value.isNotEmpty) {
      var inputNumber = int.parse(value);
      if (inputNumber > 9) {
        Get.snackbar(
          'Kittles',
          'Not in Range 0-9!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        addLitterSum();
      }
    }
  }
}
