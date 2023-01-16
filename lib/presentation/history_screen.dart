import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaction_game/presentation/view_models/history_view_model.dart';

import '../data/tools/log_tool.dart';
import '../domain/reaction_run.dart';

late HistoryViewModel _viewModel;

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLog.log("build HistoryScreen");
    _viewModel = HistoryViewModel();
    return ChangeNotifierProvider(
      create: ((context) => _viewModel),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(139, 0, 255, 1.00),
        ),
        body: const HistoryElement(),
      ),
    );
  }
}

class HistoryElement extends StatelessWidget {
  const HistoryElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var runHistory = context.select((HistoryViewModel vm) {
      vm.getHistoryFromDB();
      return vm.allRunHistory;
    });
    return runHistory.isEmpty
        ? const Center(
            child: Text(
            "EMPTY\nHISTORY",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
          ))
        : ListView.builder(
            itemCount: runHistory.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const TitleBlockWidget();
              } else {
                return HistoryBlockWidget(run: runHistory[index - 1]);
              }
            });
  }
}

class HistoryBlockWidget extends StatelessWidget {
  const HistoryBlockWidget({Key? key, required this.run}) : super(key: key);
  final ReactionRun run;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        color: const Color.fromRGBO(139, 0, 255, 0.30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextHistoryWidget(
                "${run.runDate.year}-${run.runDate.month}-${run.runDate.day} "
                "${run.runDate.hour}:${run.runDate.minute}",
                flex: 2),
            TextHistoryWidget(run.averageAllResult),
            TextHistoryWidget(run.averageResultFirst),
            TextHistoryWidget(run.averageResultTwoRing),
            TextHistoryWidget(run.averageResultMultiClick),
            TextHistoryWidget(run.mistake),
          ],
        ),
      ),
    );
  }
}

class TitleBlockWidget extends StatelessWidget {
  const TitleBlockWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            TextHistoryWidget(
              "Date",
              flex: 2,
            ),
            TextHistoryWidget("Score"),
            TextHistoryWidget("First"),
            TextHistoryWidget("TwoRing"),
            TextHistoryWidget("MultiClick"),
            TextHistoryWidget("missClick"),
          ],
        ),
      ),
    );
  }
}

class TextHistoryWidget extends StatelessWidget {
  const TextHistoryWidget(this.count, {Key? key, this.flex = 1})
      : super(key: key);
  final int flex;
  final dynamic count;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: Center(child: Text("$count")),
    );
  }
}
