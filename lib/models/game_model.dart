// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GameModel {
  final DateTime jdCeatedDate;
  final String pageId;
  final String userName;
  final String run;
  final int first;
  final int second;
  final int third;
  final int fourth;
  final int five;
  final int six;
  final int seven;
  final int eight;

  GameModel({
    required this.jdCeatedDate,
    required this.pageId,
    required this.userName,
    required this.run,
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.five,
    required this.six,
    required this.seven,
    required this.eight,
  });

  GameModel copyWith({
    DateTime? jdCreatedDate,
    String? pageId,
    String? userName,
    String? run,
    int? first,
    int? second,
    int? third,
    int? fourth,
    int? five,
    int? six,
    int? seven,
    int? eight,
  }) {
    return GameModel(
      jdCeatedDate: jdCreatedDate ?? jdCeatedDate,
      pageId: pageId ?? this.pageId,
      userName: userName ?? this.userName,
      run: run ?? this.run,
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
      fourth: fourth ?? this.fourth,
      five: five ?? this.five,
      six: six ?? this.six,
      seven: seven ?? this.seven,
      eight: eight ?? this.eight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Created': jdCeatedDate.toIso8601String(),
      'id': pageId,
      'userName': userName,
      'run': run,
      'first': first,
      'second': second,
      'third': third,
      'fourth': fourth,
      'five': five,
      'six': six,
      'seven': seven,
      'eight': eight,
    };
  }

  factory GameModel.fromMap(Map<dynamic, dynamic> map) {
    return GameModel(
      jdCeatedDate: DateTime.now(),
      pageId: '',
      userName: map['userName'] as String,
      run: map['run'] as String,
      first: int.parse(map['first']),
      second: int.parse(map['second']),
      third: int.parse(map['third']),
      fourth: int.parse(map['fourth']),
      five: int.parse(map['fives']),
      six: int.parse(map['six']),
      seven: int.parse(map['seven']),
      eight: int.parse(map['eight']),
    );
  }

  factory GameModel.fromMapNotion(Map<dynamic, dynamic> map) {
    final szId = map['id'].toString();
    final properties = map['properties'] as Map<String, dynamic>;
    final listUserName = (properties['userName']?['title'] ?? []) as List;
    final createdDate = properties['created']?['created_time'] ??
        DateTime.now().toIso8601String();
    final listRun = (properties['run']?['rich_text'] ?? []) as List;
    return GameModel(
      pageId: szId,
      userName: listUserName.isNotEmpty ? listUserName[0]['plain_text'] : '?',
      jdCeatedDate: DateTime.parse(createdDate),
      run: listRun.isNotEmpty ? listRun[0]['plain_text'] : '?',
      first: properties['first']?['number'] ?? 0,
      second: properties['second']?['number'] ?? 0,
      third: properties['third']?['number'] ?? 0,
      fourth: properties['fourth']?['number'] ?? 0,
      five: properties['fives']?['number'] ?? 0,
      six: properties['six']?['number'] ?? 0,
      seven: properties['seven']?['number'] ?? 0,
      eight: properties['eight']?['number'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMapNotion(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GameModel(pageId: $pageId, created:${jdCeatedDate.toIso8601String()} ,userName: $userName, run: $run, first: $first, second: $second, third: $third, fourth: $fourth, five: $five, six: $six, seven: $seven, eight: $eight)';
  }
}
