import 'package:flutter/material.dart';
import 'Index.dart';
import 'cell.dart';
import 'pieces.dart';
import 'snakes_ladders.dart';
import 'path.dart';

Snake_Ladder snakes = Snake_Ladder();

class Board {
  // Path path = Path();
  List<Cell> getinitialboard() {
    print(snakes.ladders);
    print(snakes.snakes);
    final boardcells = List.generate(36, (index) {
      if (snakes.snakes.contains(index)) {
        return Cell(Index(index, Colors.red), [], 0);
      } else if (snakes.ladders.contains(index)) {
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
    int ni = path.pth[player.index]! + diceno;
    // print("$diceno $ni");
    //always
    this[player.index].piece.remove(player);
    this[player.index] = Cell(this[player.index].index,
        this[player.index].piece, this[player.index].piece.length);
    player.index = path.path[ni];
    //
    //Dynamic
    if (snakes.snakes.contains(player.index)) {
      if (player.index == snakes.snakes[0] ||
          player.index == snakes.snakes[snakes.snakes.length - 1]) {
        // player.index = path.pth[player.index]!;
        this[player.index].piece.add(player);
        this[player.index] = Cell(this[player.index].index,
            this[player.index].piece, this[player.index].piece.length);
      } else {
        int si = snakes.snakes.indexOf(player.index);
        si--;
        player.index = snakes.snakes[si];
        // player.index = path.pth[player.index]!;
        this[player.index].piece.add(player);
        this[player.index] = Cell(this[player.index].index,
            this[player.index].piece, this[player.index].piece.length);
      }
    } else if (snakes.ladders.contains(player.index)) {
      if (player.index == snakes.ladders[0] ||
          player.index == snakes.ladders[snakes.ladders.length - 1]) {
        // player.index = path.pth[player.index]!;
        this[player.index].piece.add(player);
        this[player.index] = Cell(this[player.index].index,
            this[player.index].piece, this[player.index].piece.length);
      } else {
        int li = snakes.ladders.indexOf(player.index);
        li++;
        player.index = snakes.ladders[li];
        // player.index = path.pth[player.index]!;
        this[player.index].piece.add(player);
        this[player.index] = Cell(this[player.index].index,
            this[player.index].piece, this[player.index].piece.length);
      }
    } else {
      this[player.index].piece.add(player);
      this[player.index] = Cell(this[player.index].index,
          this[player.index].piece, this[player.index].piece.length);
    }

    return this;
  }

  void open() {}
}
