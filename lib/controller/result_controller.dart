import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import '../helper/data_source.dart';
import '../models/game_model.dart';
import '../models/sum_name_model.dart';

class ResultController extends GetxController {
  //static field
  static ResultController get to => Get.find<ResultController>();
  //private fields
  //final _userStorage = GetStorage('GameUsers');
  //final _gameStorageKey = 'gameKey';
  //public fields
  final szResultData = 'Score Page'.obs;
  final playScoreGameModelList = <GameModel>[].obs;
  final displayList = <GameModel>[].obs;
  final listSumNameModel = <SumNameModel>[].obs;
  //final subListGameModel = <List<GameModel>>[].obs;

  @override
  void onInit() async {
    await loadFromNotion();
    //_loadlistFromStorage();
    super.onInit();
  }

  Future<void> loadFromNotion() async {
    var data = await DataSourceNotion.getGameList();
    if (data.isNotEmpty) {
      //Method to load data from permanent storage
      playScoreGameModelList.value = data; //_userStorage.read(_gameStorageKey);
      playScoreGameModelList.sort((a, b) => a.userName.compareTo(b.userName));

      int n = int.parse((playScoreGameModelList.length / 4).toStringAsFixed(0));
      var m = (playScoreGameModelList.length / n).round();
      var resultLists = List.generate(
          n,
          (i) => playScoreGameModelList.sublist(
              m * i,
              (i + 1) * m <= playScoreGameModelList.length
                  ? (i + 1) * m
                  : null));
      //subListGameModel.value = resultLists;
      for (var resultPerUserList in resultLists) {
        resultPerUserList.sort(((a, b) => a.run.compareTo(b.run)));
        _addToSumModList(resultPerUserList);
        for (var element in resultPerUserList) {
          displayList.add(element);
        }
      }
    }
    displayList.sort((a, b) => b.jdCeatedDate.compareTo(a.jdCeatedDate));
    update();
  }

  // void _loadlistFromStorage() {

  //   if (_userStorage.hasData(_gameStorageKey)) {
  //     //Method to load data from permanent storage
  //     playScoreGameModelList.value = _userStorage.read(_gameStorageKey);
  //     playScoreGameModelList.sort((a, b) => a.userName.compareTo(b.userName));

  //     int n = int.parse((playScoreGameModelList.length / 4).toStringAsFixed(0));
  //     var m = (playScoreGameModelList.length / n).round();
  //     var resultLists = List.generate(
  //         n,
  //         (i) => playScoreGameModelList.sublist(
  //             m * i,
  //             (i + 1) * m <= playScoreGameModelList.length
  //                 ? (i + 1) * m
  //                 : null));
  //     //subListGameModel.value = resultLists;
  //     for (var resultPerUserList in resultLists) {
  //       resultPerUserList.sort(((a, b) => a.run.compareTo(b.run)));
  //       _addToSumModList(resultPerUserList);
  //       for (var element in resultPerUserList) {
  //         displayList.add(element);
  //       }
  //     }
  //   }
  //   update();
  // }

  void _addToSumModList(List<GameModel> game) {
    var sumAll = 0;
    var u = '';
    for (var i = 0; i < game.length; i++) {
      u = game[i].userName;
      if (i == 0) {
        var sum = game[i].first +
            game[i].second +
            game[i].third +
            game[i].fourth +
            game[i].five +
            game[i].six +
            game[i].seven +
            game[i].eight;
        sumAll = sumAll + sum;
      }
      if (i == 1) {
        var sum = game[i].first +
            game[i].second +
            game[i].third +
            game[i].fourth +
            game[i].five +
            game[i].six +
            game[i].seven +
            game[i].eight;
        sumAll = sumAll + sum;
      }
      if (i == 2) {
        var sum = game[i].first +
            game[i].second +
            game[i].third +
            game[i].fourth +
            game[i].five +
            game[i].six +
            game[i].seven +
            game[i].eight;
        sumAll = sumAll + sum;
      }
      if (i == 3) {
        var sum = game[i].first +
            game[i].second +
            game[i].third +
            game[i].fourth +
            game[i].five +
            game[i].six +
            game[i].seven +
            game[i].eight;
        sumAll = sumAll + sum;
      }
    }
    SumNameModel model = SumNameModel(u, sumAll);
    listSumNameModel.add(model);
  }

  String sumPerRound(int index) {
    String summe = '';
    var itemData = displayList[index];
    var mnSumme = itemData.first +
        itemData.second +
        itemData.third +
        itemData.fourth +
        itemData.five +
        itemData.six +
        itemData.seven +
        itemData.eight;
    summe = mnSumme.toString();
    return summe;
  }
}
