import 'package:flutter/material.dart';
import 'Index.dart';
import 'cell.dart';
import 'pieces.dart';
import 'snakes_ladders.dart';
import 'path.dart';

class Board {
  Snake_Ladder sl = Snake_Ladder();
  // Path path = Path();

  List<Cell> getinitialboard() {
    final boardcells = List.generate(36, (index) {
      if (sl.snakes.contains(index)) {
        return Cell(Index(index, Colors.red), [], 0);
      } else if (sl.ladders.contains(index)) {
        return Cell(Index(index, Colors.greenAccent), [], 0);
      } else {
        if (index == 30) {
          return Cell(Index(index, Colors.deepPurple),
              [Piece(Player.player1, index), Piece(Player.player2, index)], 2);
        } else {
          return Cell(Index(index, Colors.deepPurple), [], 0);
        }
      }
    });
    return boardcells;
  }
}

extension Brd on List<Cell> {
  // Snake_Ladder sl = Snake_Ladder();
  static Path path = Path();
  List<Cell> move(int diceno, Piece player) {
    int ni = path.pth()[player.index]! + diceno;
    // print("$diceno $ni");
    this[player.index].piece.remove(player);
    // print(this[player.index].piece);
    this[player.index] = Cell(this[player.index].index,
        this[player.index].piece, this[player.index].piece.length);
    player.index = path.path[ni];
    this[player.index].piece.add(player);
    this[player.index] = Cell(this[player.index].index,
        this[player.index].piece, this[player.index].piece.length);

    return this;
  }

  void open() {}
}
