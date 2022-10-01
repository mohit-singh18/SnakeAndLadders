// ignore: file_names
import 'package:flutter/material.dart';
import 'board.dart';
import 'cell.dart';
import 'dice.dart';
import 'pieces.dart';
import 'path.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  late Board brd = Board();
  late List<Cell> board;
  late Player currentTurn;
  late Piece piece1 = Piece(Player.player1, 30);
  late Piece piece2 = Piece(Player.player2, 30);
  int diceno = Dice().rolldice();
  Path path = Path();

  @override
  void initState() {
    board = brd.getinitialboard();
    currentTurn = Player.player1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 130,
          ),
          _buildboard(),
          const SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  currentTurn == Player.player1 ? 60 : 0,
                  0,
                  currentTurn == Player.player1 ? 0 : 60,
                  0),
              child: Align(
                  alignment: currentTurn == Player.player1
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: _builddice())),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(currentTurn == Player.player1 ? 10 : 0,
                0, currentTurn == Player.player1 ? 0 : 10, 0),
            child: Align(
              alignment: currentTurn == Player.player1
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Text(
                currentTurn == Player.player1 ? "Black's Turn" : "White's Turn",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildboard() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
      itemBuilder: (context, index) {
        return Container(
          child: _buildcell(index),
        );
      },
      itemCount: 6 * 6,
    );
  }

  Widget _buildcell(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        // ignore: sort_child_properties_last
        child: _buildpiece(
            board[index].numpieces, board[index].piece, Path().pth, index),
        decoration: BoxDecoration(
          color: board[index].color,
        ),
      ),
    );
  }

  Widget? _buildpiece(
      int numpieces, List<Piece> player, Map<int, int> path, int index) {
    if (numpieces == 2) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "${path[index]! + 1}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(5),
            // ignore: prefer_const_constructors
            child: Align(
              alignment: Alignment.topLeft,
              child: const Icon(
                Icons.brightness_1,
                color: Colors.black,
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(5),
            // ignore: prefer_const_constructors
            child: Align(
              alignment: Alignment.bottomRight,
              child: const Icon(
                Icons.brightness_1,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    } else if (numpieces == 1) {
      return Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.brightness_1,
            color: player[0].playertype == Player.player1
                ? Colors.black
                : Colors.white,
            size: 30,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "${path[index]! + 1}",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ]);
    } else {
      return Align(
        alignment: Alignment.topRight,
        child: Text(
          "${path[index]! + 1}",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }
  }

  Widget _builddice() {
    return GestureDetector(
      onTap: () async {
        diceno = Dice().rolldice();
        setState(() {
          board = board.move(
              diceno, Player.player1 == currentTurn ? piece1 : piece2);
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          currentTurn =
              currentTurn == Player.player1 ? Player.player2 : Player.player1;
        });
      },
      child: Container(
        child: Image.asset(
          "images/dice$diceno.png",
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}//main class


