import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaction_game/presentation/view_models/game_two_ring_view_model.dart';
import '../domain/reaction_run.dart';

late GameTwoRingViewModel _viewModel;

class GameTwoRingScreen extends StatelessWidget {
  const GameTwoRingScreen({Key? key, required this.run}) : super(key: key);
  final ReactionRun run;

  @override
  Widget build(BuildContext context) {
    _viewModel = GameTwoRingViewModel(run);
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ResultTapText(),
              Flexible(child: GameRingOne()),
              Flexible(
                child: SizedBox(),
              ),
              Flexible(child: GameRingTwo()),
              TryNumberText(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultTapText extends StatelessWidget {
  const ResultTapText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resultLastTap =
        context.select((GameTwoRingViewModel vm) => vm.resultLastTap);
    return Text(
      "$resultLastTap ms",
      style: const TextStyle(fontSize: 30),
    );
  }
}

class TryNumberText extends StatelessWidget {
  const TryNumberText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tryCount =
        context.select((GameTwoRingViewModel vm) => vm.tryClickCount);
    return Text(
      "$tryCount / ${_viewModel.completeTryClickCount}",
      style: const TextStyle(fontSize: 30),
    );
  }
}

class GameRingOne extends StatelessWidget {
  const GameRingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = context.select((GameTwoRingViewModel vm) => vm.colorOne);
    return RingWidget(color: color, ringTap: _viewModel.onRingOneTap);
  }
}

class GameRingTwo extends StatelessWidget {
  const GameRingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = context.select((GameTwoRingViewModel vm) => vm.colorTwo);
    return RingWidget(color: color, ringTap: _viewModel.onRingTwoTap);
  }
}

class RingWidget extends StatelessWidget {
  const RingWidget({
    Key? key,
    required this.color,
    required this.ringTap,
  }) : super(key: key);
  final VoidCallback ringTap;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            enableFeedback: false,
            borderRadius: const BorderRadius.all(Radius.circular(140)),
            onTapDown: ((TapDownDetails down) {
              ringTap.call();
            }),
            child: Container(
              width: double.infinity,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
