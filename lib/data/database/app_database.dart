import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [ReactionRunDbModel])
class AppDatabase extends _$AppDatabase {
  static AppDatabase get instance =>
      _instance ??= AppDatabase._crate(_openConnection());
  static AppDatabase? _instance;
  AppDatabase._crate(QueryExecutor exec) : super(exec);

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      FileSystemEntity dbFolder;
      if (Platform.isWindows) {
        dbFolder = File(Platform.script.toFilePath());
      } else {
        dbFolder = await getApplicationDocumentsDirectory();
      }
      final file = File(p.join(dbFolder.path, 'reaction_game.db'));
      return NativeDatabase(file);
    });
  }
}

class ReactionRunDbModel extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  DateTimeColumn get runDate => dateTime()();
  IntColumn get averageResultFirst => integer()();
  IntColumn get averageResultTwoRing => integer()();
  IntColumn get averageResultMultiClick => integer()();
  IntColumn get averageAllResult => integer()();
  IntColumn get mistake => integer()();
//flutter pub run build_runner build
}
