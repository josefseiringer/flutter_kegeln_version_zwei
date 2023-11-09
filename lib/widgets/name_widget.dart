// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../helper/constants.dart';

class NameWidget extends StatelessWidget {
  final String szSumPerRound;
  final String szWitchRound;
  final String szNamePlayer;
  const NameWidget({
    Key? key,
    required this.szSumPerRound,
    required this.szWitchRound,
    required this.szNamePlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = double.infinity;
    var containerHeight = 50.0;
    var colorOfContainer = Colors.green;
    return //display Username
        Container(
      decoration: BoxDecoration(
        color: colorOfContainer,
      ),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      height: containerHeight,
      width: displayWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            szNamePlayer,
            style: kStoreBoardTextName,
          ),
          const SizedBox(width: 10),
          Text(
            szWitchRound,
            style: kStoreBoardTextName,
          ),
          const SizedBox(width: 10),
          Text(
            szSumPerRound,
            style: kSumStyle,
          ),
        ],
      ),
    );
  }
}
