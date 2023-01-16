import 'package:flutter/cupertino.dart';

import '../../data/database/dao_database.dart';
import '../../data/tools/mapper.dart';
import '../../domain/reaction_run.dart';

class ResultRunViewModel extends ChangeNotifier {
  List<ReactionRun> allRunHistory = [];
  late ReactionRun _lastRun;
  int averageResultScore = 0;
  int averageResultFirst = 0;
  int averageResultTwoRing = 0;
  int averageResultMultiClick = 0;

  ResultRunViewModel() {
    getHistoryFromDB();
  }

  setUpScore() async {
    await getHistoryFromDB();
    averageResultScore = _lastRun.averageAllResult;
    notifyListeners();
  }

  setUpResultFirst() {
    averageResultFirst = _lastRun.averageResultFirst;
    notifyListeners();
  }

  setUpResultTwoRing() {
    averageResultTwoRing = _lastRun.averageResultTwoRing;
    notifyListeners();
  }

  setUpResultMultiClick() {
    averageResultMultiClick = _lastRun.averageResultMultiClick;
    notifyListeners();
  }

  getHistoryFromDB() async {
    var daoDb = DaoAppDatabase();
    await daoDb.getAllRunResults().then((runHistory) async {
      allRunHistory = ToolMapper.dbModelListToEntityList(runHistory);
      _lastRun = allRunHistory.last;
    });
  }
}
