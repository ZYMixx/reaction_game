// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class ReactionRunDbModelData extends DataClass
    implements Insertable<ReactionRunDbModelData> {
  final int? id;
  final DateTime runDate;
  final int averageResultFirst;
  final int averageResultTwoRing;
  final int averageResultMultiClick;
  final int averageAllResult;
  final int mistake;
  const ReactionRunDbModelData(
      {this.id,
      required this.runDate,
      required this.averageResultFirst,
      required this.averageResultTwoRing,
      required this.averageResultMultiClick,
      required this.averageAllResult,
      required this.mistake});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['run_date'] = Variable<DateTime>(runDate);
    map['average_result_first'] = Variable<int>(averageResultFirst);
    map['average_result_two_ring'] = Variable<int>(averageResultTwoRing);
    map['average_result_multi_click'] = Variable<int>(averageResultMultiClick);
    map['average_all_result'] = Variable<int>(averageAllResult);
    map['mistake'] = Variable<int>(mistake);
    return map;
  }

  ReactionRunDbModelCompanion toCompanion(bool nullToAbsent) {
    return ReactionRunDbModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      runDate: Value(runDate),
      averageResultFirst: Value(averageResultFirst),
      averageResultTwoRing: Value(averageResultTwoRing),
      averageResultMultiClick: Value(averageResultMultiClick),
      averageAllResult: Value(averageAllResult),
      mistake: Value(mistake),
    );
  }

  factory ReactionRunDbModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReactionRunDbModelData(
      id: serializer.fromJson<int?>(json['id']),
      runDate: serializer.fromJson<DateTime>(json['runDate']),
      averageResultFirst: serializer.fromJson<int>(json['averageResultFirst']),
      averageResultTwoRing:
          serializer.fromJson<int>(json['averageResultTwoRing']),
      averageResultMultiClick:
          serializer.fromJson<int>(json['averageResultMultiClick']),
      averageAllResult: serializer.fromJson<int>(json['averageAllResult']),
      mistake: serializer.fromJson<int>(json['mistake']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'runDate': serializer.toJson<DateTime>(runDate),
      'averageResultFirst': serializer.toJson<int>(averageResultFirst),
      'averageResultTwoRing': serializer.toJson<int>(averageResultTwoRing),
      'averageResultMultiClick':
          serializer.toJson<int>(averageResultMultiClick),
      'averageAllResult': serializer.toJson<int>(averageAllResult),
      'mistake': serializer.toJson<int>(mistake),
    };
  }

  ReactionRunDbModelData copyWith(
          {Value<int?> id = const Value.absent(),
          DateTime? runDate,
          int? averageResultFirst,
          int? averageResultTwoRing,
          int? averageResultMultiClick,
          int? averageAllResult,
          int? mistake}) =>
      ReactionRunDbModelData(
        id: id.present ? id.value : this.id,
        runDate: runDate ?? this.runDate,
        averageResultFirst: averageResultFirst ?? this.averageResultFirst,
        averageResultTwoRing: averageResultTwoRing ?? this.averageResultTwoRing,
        averageResultMultiClick:
            averageResultMultiClick ?? this.averageResultMultiClick,
        averageAllResult: averageAllResult ?? this.averageAllResult,
        mistake: mistake ?? this.mistake,
      );
  @override
  String toString() {
    return (StringBuffer('ReactionRunDbModelData(')
          ..write('id: $id, ')
          ..write('runDate: $runDate, ')
          ..write('averageResultFirst: $averageResultFirst, ')
          ..write('averageResultTwoRing: $averageResultTwoRing, ')
          ..write('averageResultMultiClick: $averageResultMultiClick, ')
          ..write('averageAllResult: $averageAllResult, ')
          ..write('mistake: $mistake')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, runDate, averageResultFirst,
      averageResultTwoRing, averageResultMultiClick, averageAllResult, mistake);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReactionRunDbModelData &&
          other.id == this.id &&
          other.runDate == this.runDate &&
          other.averageResultFirst == this.averageResultFirst &&
          other.averageResultTwoRing == this.averageResultTwoRing &&
          other.averageResultMultiClick == this.averageResultMultiClick &&
          other.averageAllResult == this.averageAllResult &&
          other.mistake == this.mistake);
}

class ReactionRunDbModelCompanion
    extends UpdateCompanion<ReactionRunDbModelData> {
  final Value<int?> id;
  final Value<DateTime> runDate;
  final Value<int> averageResultFirst;
  final Value<int> averageResultTwoRing;
  final Value<int> averageResultMultiClick;
  final Value<int> averageAllResult;
  final Value<int> mistake;
  const ReactionRunDbModelCompanion({
    this.id = const Value.absent(),
    this.runDate = const Value.absent(),
    this.averageResultFirst = const Value.absent(),
    this.averageResultTwoRing = const Value.absent(),
    this.averageResultMultiClick = const Value.absent(),
    this.averageAllResult = const Value.absent(),
    this.mistake = const Value.absent(),
  });
  ReactionRunDbModelCompanion.insert({
    this.id = const Value.absent(),
    required DateTime runDate,
    required int averageResultFirst,
    required int averageResultTwoRing,
    required int averageResultMultiClick,
    required int averageAllResult,
    required int mistake,
  })  : runDate = Value(runDate),
        averageResultFirst = Value(averageResultFirst),
        averageResultTwoRing = Value(averageResultTwoRing),
        averageResultMultiClick = Value(averageResultMultiClick),
        averageAllResult = Value(averageAllResult),
        mistake = Value(mistake);
  static Insertable<ReactionRunDbModelData> custom({
    Expression<int>? id,
    Expression<DateTime>? runDate,
    Expression<int>? averageResultFirst,
    Expression<int>? averageResultTwoRing,
    Expression<int>? averageResultMultiClick,
    Expression<int>? averageAllResult,
    Expression<int>? mistake,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (runDate != null) 'run_date': runDate,
      if (averageResultFirst != null)
        'average_result_first': averageResultFirst,
      if (averageResultTwoRing != null)
        'average_result_two_ring': averageResultTwoRing,
      if (averageResultMultiClick != null)
        'average_result_multi_click': averageResultMultiClick,
      if (averageAllResult != null) 'average_all_result': averageAllResult,
      if (mistake != null) 'mistake': mistake,
    });
  }

  ReactionRunDbModelCompanion copyWith(
      {Value<int?>? id,
      Value<DateTime>? runDate,
      Value<int>? averageResultFirst,
      Value<int>? averageResultTwoRing,
      Value<int>? averageResultMultiClick,
      Value<int>? averageAllResult,
      Value<int>? mistake}) {
    return ReactionRunDbModelCompanion(
      id: id ?? this.id,
      runDate: runDate ?? this.runDate,
      averageResultFirst: averageResultFirst ?? this.averageResultFirst,
      averageResultTwoRing: averageResultTwoRing ?? this.averageResultTwoRing,
      averageResultMultiClick:
          averageResultMultiClick ?? this.averageResultMultiClick,
      averageAllResult: averageAllResult ?? this.averageAllResult,
      mistake: mistake ?? this.mistake,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (runDate.present) {
      map['run_date'] = Variable<DateTime>(runDate.value);
    }
    if (averageResultFirst.present) {
      map['average_result_first'] = Variable<int>(averageResultFirst.value);
    }
    if (averageResultTwoRing.present) {
      map['average_result_two_ring'] =
          Variable<int>(averageResultTwoRing.value);
    }
    if (averageResultMultiClick.present) {
      map['average_result_multi_click'] =
          Variable<int>(averageResultMultiClick.value);
    }
    if (averageAllResult.present) {
      map['average_all_result'] = Variable<int>(averageAllResult.value);
    }
    if (mistake.present) {
      map['mistake'] = Variable<int>(mistake.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReactionRunDbModelCompanion(')
          ..write('id: $id, ')
          ..write('runDate: $runDate, ')
          ..write('averageResultFirst: $averageResultFirst, ')
          ..write('averageResultTwoRing: $averageResultTwoRing, ')
          ..write('averageResultMultiClick: $averageResultMultiClick, ')
          ..write('averageAllResult: $averageAllResult, ')
          ..write('mistake: $mistake')
          ..write(')'))
        .toString();
  }
}

class $ReactionRunDbModelTable extends ReactionRunDbModel
    with TableInfo<$ReactionRunDbModelTable, ReactionRunDbModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReactionRunDbModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _runDateMeta =
      const VerificationMeta('runDate');
  @override
  late final GeneratedColumn<DateTime> runDate = GeneratedColumn<DateTime>(
      'run_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _averageResultFirstMeta =
      const VerificationMeta('averageResultFirst');
  @override
  late final GeneratedColumn<int> averageResultFirst = GeneratedColumn<int>(
      'average_result_first', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _averageResultTwoRingMeta =
      const VerificationMeta('averageResultTwoRing');
  @override
  late final GeneratedColumn<int> averageResultTwoRing = GeneratedColumn<int>(
      'average_result_two_ring', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _averageResultMultiClickMeta =
      const VerificationMeta('averageResultMultiClick');
  @override
  late final GeneratedColumn<int> averageResultMultiClick =
      GeneratedColumn<int>('average_result_multi_click', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _averageAllResultMeta =
      const VerificationMeta('averageAllResult');
  @override
  late final GeneratedColumn<int> averageAllResult = GeneratedColumn<int>(
      'average_all_result', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mistakeMeta =
      const VerificationMeta('mistake');
  @override
  late final GeneratedColumn<int> mistake = GeneratedColumn<int>(
      'mistake', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        runDate,
        averageResultFirst,
        averageResultTwoRing,
        averageResultMultiClick,
        averageAllResult,
        mistake
      ];
  @override
  String get aliasedName => _alias ?? 'reaction_run_db_model';
  @override
  String get actualTableName => 'reaction_run_db_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReactionRunDbModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('run_date')) {
      context.handle(_runDateMeta,
          runDate.isAcceptableOrUnknown(data['run_date']!, _runDateMeta));
    } else if (isInserting) {
      context.missing(_runDateMeta);
    }
    if (data.containsKey('average_result_first')) {
      context.handle(
          _averageResultFirstMeta,
          averageResultFirst.isAcceptableOrUnknown(
              data['average_result_first']!, _averageResultFirstMeta));
    } else if (isInserting) {
      context.missing(_averageResultFirstMeta);
    }
    if (data.containsKey('average_result_two_ring')) {
      context.handle(
          _averageResultTwoRingMeta,
          averageResultTwoRing.isAcceptableOrUnknown(
              data['average_result_two_ring']!, _averageResultTwoRingMeta));
    } else if (isInserting) {
      context.missing(_averageResultTwoRingMeta);
    }
    if (data.containsKey('average_result_multi_click')) {
      context.handle(
          _averageResultMultiClickMeta,
          averageResultMultiClick.isAcceptableOrUnknown(
              data['average_result_multi_click']!,
              _averageResultMultiClickMeta));
    } else if (isInserting) {
      context.missing(_averageResultMultiClickMeta);
    }
    if (data.containsKey('average_all_result')) {
      context.handle(
          _averageAllResultMeta,
          averageAllResult.isAcceptableOrUnknown(
              data['average_all_result']!, _averageAllResultMeta));
    } else if (isInserting) {
      context.missing(_averageAllResultMeta);
    }
    if (data.containsKey('mistake')) {
      context.handle(_mistakeMeta,
          mistake.isAcceptableOrUnknown(data['mistake']!, _mistakeMeta));
    } else if (isInserting) {
      context.missing(_mistakeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReactionRunDbModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReactionRunDbModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      runDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}run_date'])!,
      averageResultFirst: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}average_result_first'])!,
      averageResultTwoRing: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}average_result_two_ring'])!,
      averageResultMultiClick: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}average_result_multi_click'])!,
      averageAllResult: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}average_all_result'])!,
      mistake: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mistake'])!,
    );
  }

  @override
  $ReactionRunDbModelTable createAlias(String alias) {
    return $ReactionRunDbModelTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ReactionRunDbModelTable reactionRunDbModel =
      $ReactionRunDbModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [reactionRunDbModel];
}
