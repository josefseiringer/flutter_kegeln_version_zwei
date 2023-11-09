// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../helper/constants.dart';

class MyContainerItem extends StatelessWidget {
  final String pos;
  final String description;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  const MyContainerItem({
    Key? key,
    required this.pos,
    required this.description,
    required this.backgroundColor,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: pos == 'L'
          ? Alignment.centerLeft
          : pos == 'C'
              ? Alignment.center
              : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Text(
        description,
        style: kStyleTextBig,
      ),
    );
  }
}
