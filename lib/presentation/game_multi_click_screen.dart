import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaction_game/presentation/view_models/game_multi_click_view_model.dart';
import '../domain/reaction_run.dart';

late GameMultiClickViewModel _viewModel;

class GameMultiClickScreen extends StatelessWidget {
  const GameMultiClickScreen({Key? key, required this.run}) : super(key: key);
  final ReactionRun run;

  @override
  Widget build(BuildContext context) {
    _viewModel = GameMultiClickViewModel(run);
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        body: Stack(children: [
          //Container(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ResultTapText(),
                TryNumberText(),
              ],
            ),
          ),
          const RingPosWidget(),
        ]),
      ),
    );
  }
}

class RingPosWidget extends StatelessWidget {
  const RingPosWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double? posX;
    double? posY;
    context.select((GameMultiClickViewModel vm) {
      vm.createFirstRandomPosition(context);
      posX = vm.posRingX;
      posY = vm.posRingY;
      return vm.posRingX;
    });
    return Positioned(
      top: posY,
      bottom: null,
      left: posX,
      right: null,
      width: height / 12,
      child: GameRing(
        key: UniqueKey(),
      ),
    );
  }
}

class GameRing extends StatefulWidget {
  const GameRing({Key? key}) : super(key: key);

  @override
  State<GameRing> createState() => _GameRingState();
}

class _GameRingState extends State<GameRing> {
  var scaleAnimation = 0.6;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        scaleAnimation = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 70),
      scale: scaleAnimation,
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width / 2)),
            enableFeedback: false,
            onTapDown: ((TapDownDetails down) {
              _viewModel.onRingTap(context);
            }),
            child: Container(
              width: double.infinity,
              color: Colors.red,
            ),
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
        context.select((GameMultiClickViewModel vm) => vm.resultLastTap);
    return Text(
      "\n$resultLastTap ms",
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
        context.select((GameMultiClickViewModel vm) => vm.tryClickCount);
    return Text(
      "$tryCount / ${_viewModel.completeTryClickCount}\n",
      style: const TextStyle(fontSize: 30),
    );
  }
}
