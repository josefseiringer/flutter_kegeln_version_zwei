import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/result_controller.dart';
import '../widgets/name_widget.dart';
import '../widgets/score_user_widget.dart';
import '../widgets/top_score_widget.dart';
import '../pages/game_page.dart';

class ResultPage extends StatelessWidget {
  static const namedRoute = '/Result-Page';
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var resultCtrl = ResultController.to;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Score Page'),
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(GamePage.namedRoute),
            icon: const Icon(Icons.home_max_outlined),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: resultCtrl.displayList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        TopScoreWidget(resultCtrl: resultCtrl),
                        Container(
                          width: double.infinity,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: resultCtrl.displayList.length,
                            itemBuilder: (context, index) {
                              return
                                  //display Username first Player
                                  Column(
                                children: [
                                  NameWidget(
                                    szNamePlayer:
                                        resultCtrl.displayList[index].userName,
                                    szWitchRound: resultCtrl
                                                .displayList[index].run ==
                                            'A'
                                        ? '1st'
                                        : resultCtrl.displayList[index].run ==
                                                'B'
                                            ? '2nd'
                                            : resultCtrl.displayList[index]
                                                        .run ==
                                                    'C'
                                                ? '3rd'
                                                : resultCtrl.displayList[index]
                                                            .run ==
                                                        'D'
                                                    ? '4th'
                                                    : '',
                                    szSumPerRound:
                                        resultCtrl.sumPerRound(index),
                                  ),
                                  ScoreBoardUserWidget(
                                      currentUserModel:
                                          resultCtrl.displayList[index]),
                                  Container(
                                    width: double.infinity,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text('No Data to display!!'),
                ),
        ),
      ),
    );
  }
}
