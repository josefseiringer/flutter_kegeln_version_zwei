import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import '../models/game_model.dart';

class DataSourceNotion {
  static Future<List<GameModel>> getGameList() async {
    List<GameModel> resultList = [];
    try {
      final response = await http.post(
        Uri.parse(kUrlToKegelApiQuery),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $kKegelApiKey',
          'Content-Type': 'application/json',
          'Notion-Version': '2022-06-28',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        resultList = (data['results'] as List)
            .map((e) => GameModel.fromMapNotion(e))
            .toList();
      } else {
        debugPrint('Something went wrong!\n${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Something went wrong!\n${error.toString()}');
    }
    return resultList;
  }

  static Future<bool> saveOverAPIService(
    String userName,
    String whitchRun, //A,B,C,D
    int first,
    int second,
    int third,
    int fourth,
    int five,
    int six,
    int seven,
    int eight,
  ) async {
    bool erfolg = false;
    var insertMap = DataSourceNotion.currentBodyItemMap(
      userName,
      whitchRun,
      first,
      second,
      third,
      fourth,
      five,
      six,
      seven,
      eight,
    );
    var httpClient = http.Client();
    var saveUrl = Uri.parse(kBasePageURL);
    var palletData = json.encode(insertMap);
    var response = await httpClient.post(
      saveUrl,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $kKegelApiKey',
        'accept' : 'application/json',
        'content-type': 'application/json',
        'Notion-Version': '2022-06-28',
      },
      body: palletData,
    );
    //end post
    if (response.statusCode == 200) {
      erfolg = true;
    } else {
      debugPrint(response.body.toString());
    }
    httpClient.close();

    return erfolg;
  }

  static Map<String, dynamic> currentBodyItemMap(
    String userName,
    String whitchRun, //A,B,C,D
    int first,
    int second,
    int third,
    int fourth,
    int five,
    int six,
    int seven,
    int eight,
  ) {
    return {
      "parent": {
        "type": "database_id",
        "database_id": kKegelDataBaseId
      },
      "properties": {
        "userName": {
          "title": [
            {
              "text": {
                "content": userName,
              },
            }
          ]
        },
        "run": {
          "rich_text": [
            {
              "type": "text",
              "text": {
                "content": whitchRun,
              },
            }
          ]
        },
        "first": {
          "number": first,
        },
        "second": {
          "number": second,
        },
        "third": {
          "number": third,
        },
        "fourth": {
          "number": fourth,
        },
        "fives": {
          "number": five,
        },
        "six": {
          "number": six,
        },
        "seven": {
          "number": seven,
        },
        "eight": {
          "number": eight,
        }
      },
    };
  }
}
