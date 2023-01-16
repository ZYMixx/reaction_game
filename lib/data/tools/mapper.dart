import 'package:reaction_game/data/database/app_database.dart';
import 'package:reaction_game/domain/reaction_run.dart';

class ToolMapper {
  static ReactionRunDbModelData entityRunToDbModel(ReactionRun entity) =>
      ReactionRunDbModelData(
        runDate: entity.runDate,
        mistake: entity.mistake,
        averageResultFirst: entity.averageResultFirst,
        averageResultTwoRing: entity.averageResultTwoRing,
        averageResultMultiClick: entity.averageResultMultiClick,
        averageAllResult: entity.averageAllResult,
      );

  static ReactionRun dbModelRunToEntityRun(ReactionRunDbModelData dbModel) {
    ReactionRun run = ReactionRun(dbModel.runDate);
    run.resultsListFirst = [dbModel.averageResultFirst];
    run.resultsListTwoRing = [dbModel.averageResultTwoRing];
    run.resultsListMultiClick = [dbModel.averageResultMultiClick];
    run.mistake = dbModel.mistake;
    return run;
  }

  static List<ReactionRun> dbModelListToEntityList(
          List<ReactionRunDbModelData> dbList) =>
      dbList.map((e) => dbModelRunToEntityRun(e)).toList();
}
