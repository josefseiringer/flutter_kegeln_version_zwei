import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/game_controller.dart';
import '../helper/constants.dart';

class GameUserWidget extends StatelessWidget {
  const GameUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameCtrl = GameController.to;
    var gridItemHeightBig = 130.0;
    var gridItemHeightSmall = 70.0;
    var addButtonHeight = 50.0;
    var colourOfContainer = Colors.red;
    return Column(
      children: [
        //user Drop Down
        gameCtrl.myUsersDropDown(),
        //current Rounds
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: gridItemHeightSmall,
          color: Colors.grey.shade300,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 8,
            crossAxisSpacing: 2,
            childAspectRatio: 0.8,
            children: [
              //input 1
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.firstSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 2
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.secondSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 3
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.thirdSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 4
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.fourthSkittleNumber,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                  ),
                ),
              ),
              //input 5
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.fiveSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 6
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.sixSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 7
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.sevenSkittleNumber,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                  ),
                ),
              ),
              //input 8
              Container(
                color: colourOfContainer,
                child: Center(
                  child: TextField(
                    onChanged: (value) => gameCtrl.checkInput(value),
                    controller: gameCtrl.eightSkittleNumber,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: kStyleTextFieldSmall,
                    decoration: const InputDecoration.collapsed(hintText: '0'),
                  ),
                ),
              ),
            ],
          ),
        ),
        //sum from 8 skittles
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Obx(
              () => Text(
                gameCtrl.mnSummePerUser.value.toString(),
                style: kSumStyle,
              ),
            ),
          ),
        ),
        //final per Round
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: gridItemHeightBig,
          color: Colors.grey.shade300,
          child: Obx(
            () => GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              childAspectRatio: 0.7,
              children: [
                //first run
                Container(
                  color: colourOfContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          gameCtrl.firstSum.value.toString(),
                          style: kStyleTextBig,
                        ),
                      ),
                      InkWell(
                        onTap: () => gameCtrl.addSumOfFourSkittles('first'),
                        child: Container(
                          width: double.infinity,
                          height: addButtonHeight,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'ADD 1st',
                              style: kButtonADD,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //second run
                Container(
                  color: colourOfContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          gameCtrl.secondSum.value.toString(),
                          style: kStyleTextBig,
                        ),
                      ),
                      InkWell(
                        onTap: () => gameCtrl.addSumOfFourSkittles('second'),
                        child: Container(
                          width: double.infinity,
                          height: addButtonHeight,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'ADD 2nd',
                              style: kButtonADD,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //third run
                Container(
                  color: colourOfContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          gameCtrl.thirdSum.value.toString(),
                          style: kStyleTextBig,
                        ),
                      ),
                      InkWell(
                        onTap: () => gameCtrl.addSumOfFourSkittles('third'),
                        child: Container(
                          width: double.infinity,
                          height: addButtonHeight,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'ADD 3rd',
                              style: kButtonADD,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //fourth run
                Container(
                  color: colourOfContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          gameCtrl.fourthSum.value.toString(),
                          style: kStyleTextBig,
                        ),
                      ),
                      InkWell(
                        onTap: () => gameCtrl.addSumOfFourSkittles('fourth'),
                        child: Container(
                          width: double.infinity,
                          height: addButtonHeight,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'ADD 4th',
                              style: kButtonADD,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //display sum of four rounds
        Container(
          decoration: kSumContainerDecoration,
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Obx(
              () => Text(
                gameCtrl.mnSummAllSkittles.value.toString(),
                style: kSumStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
