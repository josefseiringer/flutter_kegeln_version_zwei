import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../helper/sample_routs.dart';
import '../pages/user_input_page.dart';
import '../helper/sample_bindings.dart';

void main() async {
  await GetStorage.init('GameUsers');
  await GetStorage.init('GameData');
  SampleBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Kegeln',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: UserInputPage.namedRoute,
      getPages: SampleRouts.samplePages,
    );
  }
}
