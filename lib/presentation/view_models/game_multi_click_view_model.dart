import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reaction_game/data/database/dao_database.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';
import 'package:reaction_game/data/tools/mapper.dart';
import 'package:reaction_game/domain/reaction_run.dart';
import 'package:reaction_game/presentation/result_run_screen.dart';
import '../launch_screen.dart';
import '../alert_message_screen.dart';

class GameMultiClickViewModel extends ChangeNotifier {
  late ReactionRun currentRun;
  MaterialColor color = Colors.red;
  int resultLastTap = 0;
  DateTime? startTime;
  late int difference;
  bool readyForTap = false; //
  int tryClickCount = 0;
  int completeTryClickCount = 10;

  double posRingX = 0;
  double posRingY = 0;

  String thirdRoundRules = "Поподай по краснойм точке";

  GameMultiClickViewModel(ReactionRun run) {
    currentRun = run;
    checkFirstStart();
  }

  checkFirstStart() {
    if (LaunchScreen.firstRun) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(milliseconds: 600)).then((value) => {
              ToolNavigator.pushAlert(
                  AlertMessage(text: thirdRoundRules, callback: () {}))
            });
      });
    }
  }

  createFirstRandomPosition(BuildContext context) {
    var height = MediaQuery.of(context).size.height.toInt();
    var width = MediaQuery.of(context).size.width.toInt();
    posRingY = Random.secure().nextInt(height - height ~/ 12).toDouble();
    posRingX = Random.secure().nextInt(width - width ~/ 12).toDouble();
  }

  createRandomPosition(BuildContext context) {
    var height = MediaQuery.of(context).size.height.toInt();
    var width = MediaQuery.of(context).size.width.toInt();

    posRingY =
        Random.secure().nextInt(height - height ~/ 6).toDouble() + height ~/ 12;
    posRingX =
        Random.secure().nextInt(width - height ~/ 12).toDouble(); //не ошибка
    startTime = DateTime.now();
    notifyListeners();
  }

  onRingTap(BuildContext context) async {
    var tapTime = DateTime.now();
    if (startTime == null) {
      createRandomPosition(context);
      notifyListeners();
      return;
    }
    difference = tapTime.difference(startTime!).inMilliseconds - 5;
    resultLastTap = difference;
    updateRunState();
    if (await checkEndRun()) {
      return;
    }
    createRandomPosition(context);
    notifyListeners();
    currentRun.mistake += 1;
  }

  updateRunState() {
    tryClickCount++;
    currentRun.resultsListMultiClick.add(difference);
  }

  Future<bool> checkEndRun() async {
    if (tryClickCount >= completeTryClickCount) {
      var daoDb = DaoAppDatabase();
      await daoDb.insertReactionRun(ToolMapper.entityRunToDbModel(currentRun));
      ToolNavigator.set(const ResultRunScreen());
      return true;
    }
    return false;
  }
}
