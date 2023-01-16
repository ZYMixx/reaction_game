import 'package:collection/collection.dart';

class ReactionRun {
  ReactionRun(this.runDate);
  late final DateTime runDate;
  int mistake = 0;
  List<int> resultsListFirst = [];
  List<int> resultsListTwoRing = [];
  List<int> resultsListMultiClick = [];
  int get averageResultFirst => resultsListFirst.average.toInt();
  int get averageResultTwoRing => resultsListTwoRing.average.toInt();
  int get averageResultMultiClick => resultsListMultiClick.average.toInt();
  int get averageAllResult => [
        averageResultFirst,
        averageResultTwoRing,
        averageResultMultiClick
      ].average.toInt();
}
