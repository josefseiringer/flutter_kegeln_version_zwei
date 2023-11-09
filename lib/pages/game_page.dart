import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/game_controller.dart';
import '../pages/result_page.dart';
import '../pages/user_input_page.dart';
import '../widgets/game_user_widget.dart';

class GamePage extends StatelessWidget {
  static const namedRoute = '/Game-Page';
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var gameCtrl = GameController.to;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Game Page'),
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(UserInputPage.namedRoute),
            icon: const Icon(Icons.person_outline_rounded),
          ),
          IconButton(
            onPressed: (() => Get.offNamed(ResultPage.namedRoute)),
            icon: const Icon(Icons.score_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const GameUserWidget(),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: () => gameCtrl.saveScoreBoardInList(),
                    label: Text(
                      'Update User ${gameCtrl.dropDownSelectedUserName.toString()}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
