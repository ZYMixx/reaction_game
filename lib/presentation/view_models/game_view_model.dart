import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';
import 'package:reaction_game/domain/reaction_run.dart';
import 'package:reaction_game/presentation/game_two_ring_screen.dart';
import 'package:reaction_game/presentation/launch_screen.dart';

import '../alert_message_screen.dart';

class GameViewModel extends ChangeNotifier {
  late ReactionRun currentRun;
  Color color = Colors.red;
  int resultLastTap = 0;
  late DateTime startTime;
  late int difference;
  bool readyForTap = false;
  int tryClickCount = 0;
  int completeTryClickCount = 4;
  bool firstStart = true;

  String firstStartText = "Добро пожаловать\n"
      "Вас ждёт три раунда игр на реакцию.\n"
      "финальный рейтин обьединит результаты\n\n"
      "кликайте и следуйте простым указаниям\n\n";
  String firstRoundRules = "Жмите, когда круг станет зелёным.\n "
      "так быстро как только сможете\n "
      "ошибки чатильно считаются\n\nНачнём";

  GameViewModel() {
    currentRun = ReactionRun(DateTime.now());
    checkFirstStart();
  }

  checkFirstStart() {
    if (LaunchScreen.firstRun) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(milliseconds: 700)).then((value) => {
              ToolNavigator.pushAlert(
                AlertMessage(
                    text: firstStartText,
                    callback: () {
                      ToolNavigator.pushAlert(AlertMessage(
                          text: firstRoundRules,
                          callback: () {
                            changeColor();
                          }));
                    }),
              ),
            });
      });
    } else {
      changeColor();
    }
  }

  onRingTap() async {
    var tapTime = DateTime.now();
    if (readyForTap) {
      readyForTap = false;
      difference = tapTime.difference(startTime).inMilliseconds - 5;
      resultLastTap = difference;
      updateRunState();
      if (await checkEndRun()) {
        return;
      }
      changeColor();
      notifyListeners();
    } else {
      currentRun.mistake += 1;
    }
  }

  updateRunState() {
    tryClickCount++;
    currentRun.resultsListFirst.add(difference);
  }

  changeColor() {
    color = Colors.red;
    var dur = Random.secure().nextInt(5000) + 200;
    Future.delayed(Duration(milliseconds: dur)).then((value) {
      startTime = DateTime.now();
      readyForTap = true;
      color = Colors.green;
      notifyListeners();
    });
  }

  Future<bool> checkEndRun() async {
    if (tryClickCount >= completeTryClickCount) {
      jumpToNextScreen();
      return true;
    }
    return false;
  }

  jumpToNextScreen() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      ToolNavigator.set(GameTwoRingScreen(run: currentRun));
    });
    color = const Color.fromRGBO(139, 0, 255, 0.90);
    notifyListeners();
  }
}
