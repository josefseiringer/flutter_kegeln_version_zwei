import 'package:flutter_skittles_app/pages/user_input_page.dart';
import 'package:get/get.dart';
import 'sample_bindings.dart';
import '../pages/result_page.dart';
import '../pages/game_page.dart';

class SampleRouts {
  static List<GetPage<dynamic>> samplePages = [
    GetPage(
      name: UserInputPage.namedRoute,
      page: (() => const UserInputPage()),
      binding: SampleBindings(),
    ),
     GetPage(
      name: GamePage.namedRoute,
      page: (() => const GamePage()),
      binding: SampleBindings(),
    ),
    GetPage(
      name: ResultPage.namedRoute,
      page: (() => const ResultPage()),
      binding: SampleBindings(),
    ),
  ];
}