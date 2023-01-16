import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';
import 'package:reaction_game/domain/reaction_run.dart';
import 'package:reaction_game/presentation/game_multi_click_screen.dart';
import '../launch_screen.dart';
import '../alert_message_screen.dart';

class GameTwoRingViewModel extends ChangeNotifier {
  late ReactionRun currentRun;
  MaterialColor colorOne = Colors.red;
  MaterialColor colorTwo = Colors.red;
  int resultLastTap = 0;
  late DateTime startTime;
  late int difference;
  bool readyForTapOne = false;
  bool readyForTapTwo = false;
  int tryClickCount = 0;
  int completeTryClickCount = 4;
  int chanceToRollOne = 4; // 1 к X

  String secondRoundRules = "Следующий раунд\n"
      "Добовляем второй круг\n"
      "Цвет так же будет меняться на зелённый\n\n"
      "Вероятность у каждого круга своя\n "
      "Верхний: 25%\n"
      "Нижний: 75%\n";

  GameTwoRingViewModel(ReactionRun run) {
    currentRun = run;
    checkFirstStart();
  }

  checkFirstStart() {
    if (LaunchScreen.firstRun) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(milliseconds: 600)).then((value) => {
              ToolNavigator.pushAlert(AlertMessage(
                  text: secondRoundRules,
                  callback: () {
                    changeColor();
                  }))
            });
      });
    } else {
      changeColor();
    }
  }

  onRingOneTap() {
    if (readyForTapOne) {
      onRingTap();
    } else {
      currentRun.mistake += 1;
    }
  }

  onRingTwoTap() {
    if (readyForTapTwo) {
      onRingTap();
    } else {
      currentRun.mistake += 1;
    }
  }

  onRingTap() async {
    var tapTime = DateTime.now();
    difference = tapTime.difference(startTime).inMilliseconds - 5;
    resultLastTap = difference;
    updateRunState();
    if (await checkEndRun()) {
      return;
    }
    changeColor();
    notifyListeners();
  }

  updateRunState() {
    readyForTapOne = false;
    readyForTapTwo = false;
    tryClickCount++;
    currentRun.resultsListTwoRing.add(difference);
  }

  changeColor() {
    colorOne = Colors.red;
    colorTwo = Colors.red;
    var dur = Random.secure().nextInt(5000) + 200;
    Future.delayed(Duration(milliseconds: dur)).then((value) {
      startTime = DateTime.now();
      randomOneOrTwo(chanceToRollOne);
      notifyListeners();
    });
  }

  randomOneOrTwo(int maxInt) {
    int rand = Random().nextInt(maxInt);
    if (rand == 0) {
      colorOne = Colors.green;
      readyForTapOne = true;
    } else {
      colorTwo = Colors.green;
      readyForTapTwo = true;
    }
  }

  Future<bool> checkEndRun() async {
    if (tryClickCount >= completeTryClickCount) {
      ToolNavigator.set(GameMultiClickScreen(run: currentRun));
      return true;
    }
    return false;
  }
}
