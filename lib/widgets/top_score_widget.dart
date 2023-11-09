import 'package:flutter/material.dart';
import '../controller/result_controller.dart';
import '../helper/constants.dart';

class TopScoreWidget extends StatelessWidget {
  const TopScoreWidget({
    Key? key,
    required this.resultCtrl,
  }) : super(key: key);

  final ResultController resultCtrl;

  @override
  Widget build(BuildContext context) {
    double containerHeight = 100.0;
    return Container(
      height: resultCtrl.listSumNameModel.length > 3
          ? containerHeight * 1.5
          : containerHeight,
      width: double.infinity,
      color: Colors.red,
      child: GridView.builder(
        itemCount: resultCtrl.listSumNameModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          childAspectRatio: 1.34,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                resultCtrl.listSumNameModel[index].szUserName,
                style: kStyleTextFieldSmall,
              ),
              Text(
                resultCtrl.listSumNameModel[index].mnSumme.toString(),
                style: kStyleTextBig,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
