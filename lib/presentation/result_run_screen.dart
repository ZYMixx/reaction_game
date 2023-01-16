import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';
import 'package:reaction_game/presentation/launch_screen.dart';
import 'package:reaction_game/presentation/view_models/result_run_view_model.dart';

late ResultRunViewModel _viewModel;
late List<VoidCallback> updateCallBack;

const double MAIN_TEXT_SIZE = 52;
const double SECOND_TEXT_SIZE = 42;
const double TITLE_TEXT_SIZE = 16;
const Color scoreColor = Colors.black;

const Color secondScoreColor = Colors.black54;

class ResultRunScreen extends StatelessWidget {
  const ResultRunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation();
    });
    _viewModel = ResultRunViewModel();
    updateCallBack = [
      _viewModel.setUpResultFirst,
      _viewModel.setUpResultTwoRing,
      _viewModel.setUpResultMultiClick
    ];
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => _viewModel,
        child: const AllScoreBox(),
      ),
    );
  }
}

Duration animateDelay = const Duration(milliseconds: 500);

startAnimation() async {
  for (var callback in updateCallBack) {
    await Future.delayed(animateDelay).then((_) => callback.call());
  }
}

class AllScoreBox extends StatelessWidget {
  const AllScoreBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          AverageScore(),
          FirstGameScore(),
          SecondGameScore(),
          ThirdGameScore(),
          GameRing(),
        ],
      ),
    );
  }
}

class TextTitle extends Text {
  const TextTitle(String data, {super.key})
      : super(
          data,
          style: const TextStyle(fontSize: TITLE_TEXT_SIZE),
        );
}

class AverageScore extends StatelessWidget {
  const AverageScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.setUpScore();
    });
    int? averageMainScore =
        context.select((ResultRunViewModel vm) => vm.averageResultScore);
    return AnimatedCount(
      count: averageMainScore ?? 0,
      duration: const Duration(milliseconds: 4500),
      textStyle: const TextStyle(fontSize: MAIN_TEXT_SIZE, color: scoreColor),
      textTitle: const TextTitle("score:"),
    );
  }
}

class FirstGameScore extends StatelessWidget {
  const FirstGameScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? firstResult =
        context.select((ResultRunViewModel vm) => vm.averageResultFirst);
    return AnimatedCount(
      count: firstResult ?? 0,
      duration: const Duration(seconds: 3),
      textStyle:
          const TextStyle(fontSize: SECOND_TEXT_SIZE, color: secondScoreColor),
      textTitle: const TextTitle("one ring:"),
    );
  }
}

// child: Text(
// "${last?.averageResult ?? 0}",
// style: TextStyle(fontSize: SECOND_TEXT_SIZE),

class SecondGameScore extends StatelessWidget {
  const SecondGameScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? secondResult =
        context.select((ResultRunViewModel vm) => vm.averageResultTwoRing);
    return AnimatedCount(
      count: secondResult ?? 0,
      duration: const Duration(seconds: 3),
      textStyle:
          const TextStyle(fontSize: SECOND_TEXT_SIZE, color: secondScoreColor),
      textTitle: const TextTitle("two rings:"),
    );
  }
}

class ThirdGameScore extends StatelessWidget {
  const ThirdGameScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? multiClickResult =
        context.select((ResultRunViewModel vm) => vm.averageResultMultiClick);
    return AnimatedCount(
      count: multiClickResult ?? 0,
      duration: const Duration(seconds: 3),
      textStyle:
          const TextStyle(fontSize: SECOND_TEXT_SIZE, color: secondScoreColor),
      textTitle: const TextTitle("multi clicks:"),
    );
  }
}

class GameRing extends StatefulWidget {
  const GameRing({Key? key}) : super(key: key);

  @override
  State<GameRing> createState() => _GameRingState();
}

class _GameRingState extends State<GameRing> {
  var opacity = 0.0;

  @override
  void initState() {
    updateCallBack.add(() {
      setState(() {
        opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 130, left: 130),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 1000),
          child: ClipOval(
            child: AspectRatio(
              aspectRatio: 1,
              child: InkWell(
                enableFeedback: false,
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width / 2)),
                onTapDown: ((TapDownDetails down) {
                  ToolNavigator.set(const LaunchScreen());
                }),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: const Center(
                      child: Text(
                    "HOME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextScoreBlock extends StatelessWidget {
  const TextScoreBlock(
      {Key? key,
      required this.textTitle,
      this.textStyle,
      required this.scoreTextWidget})
      : super(key: key);

  final String score = "";
  final RichText scoreTextWidget;
  final TextTitle textTitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textTitle,
        scoreTextWidget,
      ],
    );
  }
}

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount(
      {Key? key,
      required this.count,
      required this.textStyle,
      required this.textTitle,
      required Duration duration,
      Curve curve = Curves.easeOutExpo})
      : super(duration: duration, curve: curve, key: key);

  final int count;
  final TextStyle textStyle;
  final TextTitle textTitle;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  _AnimatedCountState();

  IntTween? _count;

  Offset offset = const Offset(0.0, 0.0);
  var tweenScale = Tween<double>(begin: 1.0, end: 1.2);
  var tweenOpacity = Tween<double>(begin: 0.0, end: 1.0);
  var tweenOffset =
      Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.0, 0.2));
  var tweenEdge = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(top: 0),
      end: const EdgeInsets.only(top: 20, bottom: 10));
  double testMove = 0.0;

  @override
  Widget build(BuildContext context) {
/*    Future.delayed(Duration(milliseconds: 400))
        .then((_) => widget.callBack?.call());*/
    return AnimatedOpacity(
      opacity: animation.drive(tweenOpacity).value,
      duration: const Duration(milliseconds: 100),
      child: AnimatedScale(
        scale: animation.drive(tweenScale).value,
        duration: const Duration(milliseconds: 700),
        child: AnimatedPadding(
          padding: animation.drive(tweenEdge).value,
          duration: const Duration(milliseconds: 700),
          child: AnimatedSlide(
            offset: animation.drive(tweenOffset).value,
            duration: const Duration(milliseconds: 700),
            child: TextScoreBlock(
              textTitle: widget.textTitle,
              scoreTextWidget: RichText(
                text: TextSpan(
                    text: _count?.evaluate(animation).toString() ?? "110",
                    style: widget.textStyle,
                    children: [
                      TextSpan(
                          text: "ms",
                          style: DefaultTextStyle.of(context).style),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _count = visitor.call(
            _count, widget.count, (dynamic value) => IntTween(begin: value))
        as IntTween;
  }
}
