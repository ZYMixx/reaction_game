import 'app_database.dart';

class DaoAppDatabase {
  AppDatabase db = AppDatabase.instance;

  Future<List<ReactionRunDbModelData>> getAllRunResults() =>
      db.select(db.reactionRunDbModel).get();

  Stream<List<ReactionRunDbModelData>> watchAllTasks() =>
      db.select(db.reactionRunDbModel).watch();

  Future insertReactionRun(ReactionRunDbModelData run) =>
      db.into(db.reactionRunDbModel).insert(run);

  Future deleteReactionRun(ReactionRunDbModelData run) =>
      db.delete(db.reactionRunDbModel).delete(run);
}
