import 'package:flutter/cupertino.dart';

import '../../data/database/dao_database.dart';
import '../../data/tools/mapper.dart';
import '../../domain/reaction_run.dart';

class HistoryViewModel extends ChangeNotifier {
  List<ReactionRun> allRunHistory = [];

  getHistoryFromDB() async {
    var daoDb = DaoAppDatabase();
    await daoDb.getAllRunResults().then((runHistory) async {
      allRunHistory = ToolMapper.dbModelListToEntityList(runHistory);
      notifyListeners();
    });
  }
}
