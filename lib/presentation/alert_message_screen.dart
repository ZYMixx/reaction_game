import 'package:flutter/material.dart';
import 'package:reaction_game/data/tools/navigation_tool.dart';

VoidCallback? _callback;

class AlertMessage extends StatefulWidget {
  AlertMessage({Key? key, VoidCallback? callback, required this.text})
      : super(key: key) {
    _callback = callback;
  }
  final String text;

  @override
  State<AlertMessage> createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  void dispose() {
    Future.microtask(() => {_callback?.call()});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.0),
      body: InkWell(
        onTap: () {
          ToolNavigator.pop();
        },
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor: const Color.fromRGBO(139, 0, 255, 0.90),
          elevation: 10,
          title: const Center(child: Text("Reaction Game")),
          content: InkWell(
            child: Builder(builder: (context) {
              return Container(
                child: (Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                )),
              );
            }),
          ),
        ),
      ),
    );
  }
}
