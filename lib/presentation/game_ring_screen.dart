import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaction_game/presentation/view_models/game_view_model.dart';

late GameViewModel _viewModel;

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _viewModel = GameViewModel();
    return ChangeNotifierProvider(
      create: ((context) => _viewModel),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Flexible(child: ResultTapText()),
              Expanded(
                flex: 2,
                child: GameRing(),
              ),
              Flexible(child: TryNumberText()),
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
    var resultLastTap = context.select((GameViewModel vm) => vm.resultLastTap);
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
    var tryCount = context.select((GameViewModel vm) => vm.tryClickCount);
    return Text(
      "$tryCount / ${_viewModel.completeTryClickCount}",
      style: const TextStyle(fontSize: 30),
    );
  }
}

class GameRing extends StatelessWidget {
  const GameRing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = context.select((GameViewModel vm) => vm.color);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            enableFeedback: false,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width / 2)),
            onTapDown: ((TapDownDetails down) {
              _viewModel.onRingTap();
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
