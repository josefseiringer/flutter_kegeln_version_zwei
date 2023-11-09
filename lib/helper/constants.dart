import 'package:flutter/material.dart';

var kStyleTextFieldSmall = const TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

var kStoreBoardTextName = const TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

var kStyleTextBig = const TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

var kButtonADD = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

var kSumStyle = const TextStyle(
  color: Colors.pink,
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

var kSumContainerDecoration = const BoxDecoration(
  color: Colors.black,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  ),
);

//static class to hold data from the different pages
class StaticClassData {
  static List<dynamic> staticGameList = [];
}

var kKegelApiKey = '<Your secretKey from Notion> ';
var kKegelDataBaseId = '<Your DbId from Notion>';
var kUrlToKegelApiQuery =
    'https://api.notion.com/v1/databases/$kKegelDataBaseId/query';
var kUrlToSaveApi = '';
//gemeinsame Urls
var kBasePageURL = 'https://api.notion.com/v1/pages';
