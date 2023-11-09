import 'package:flutter/material.dart';
import '../models/game_model.dart';
import 'my_container_item.dart';

class ScoreBoardUserWidget extends StatelessWidget {
  final GameModel currentUserModel;

  const ScoreBoardUserWidget({super.key, required this.currentUserModel});

  @override
  Widget build(BuildContext context) {
    var displayWidth = double.infinity;
    var containerHeight = 47.0;
    var colorOfContainer = Colors.red;
    var padding = const EdgeInsets.only(left:0);
    return Column(
      children: [
        //first round
        Container(
          color: colorOfContainer,
          width: displayWidth,
          height: containerHeight,
          child: GridView.count(
            crossAxisCount: 8,
            children: [
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.first.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.second.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.third.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.fourth.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.five.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.six.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos: 'C',
                description: currentUserModel.seven.toString(),
              ),
              MyContainerItem(
                padding: padding,
                backgroundColor: Colors.red,
                pos:'C',
                description: currentUserModel.eight.toString(),
              ),
            ],
          ),
        )
        //second round
        //third round
        //fourth round
      ],
    );
  }
}
