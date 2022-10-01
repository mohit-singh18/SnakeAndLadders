import 'package:flutter/material.dart';
import 'Game.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
              child: Text(
            "Snake And Ladder Game",
          )),
        ),
        body: const Gameboard(),
      ),
    );
  }
}
