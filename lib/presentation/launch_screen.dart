import 'package:flutter/material.dart';
import 'package:reaction_game/data/database/dao_database.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';
import 'package:reaction_game/presentation/history_screen.dart';
import 'game_ring_screen.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  static bool firstRun = true;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DaoAppDatabase().getAllRunResults().then((history) {
        firstRun = history.isEmpty;
      });
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "REACTION GAME",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            MainMenuButton(onPressed: jumpToGameScreen, name: "Start Game"),
            MainMenuButton(onPressed: jumpToHistoryScreen, name: "History")
          ],
        ),
      ),
    );
  }
}

jumpToGameScreen() {
  ToolNavigator.push(const GameScreen());
}

jumpToHistoryScreen() {
  ToolNavigator.push(const HistoryScreen());
}

class MainMenuButton extends StatefulWidget {
  const MainMenuButton(
      {super.key, required this.onPressed, required this.name});
  final String name;
  final VoidCallback onPressed;

  @override
  State<MainMenuButton> createState() => _MainMenuButtonState();
}

class _MainMenuButtonState extends State<MainMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size.fromHeight(50),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(139, 0, 255, 0.90))),
        child: Text(
          widget.name,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
//Color.fromRGBO(139, 0, 255, 0.90)
