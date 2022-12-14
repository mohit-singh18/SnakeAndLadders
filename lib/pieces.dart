import 'package:flutter/material.dart';

enum Player {
  player1,
  player2;
}

class Piece {
  Player playertype;
  int index;
  bool open;
  Piece(this.playertype, this.index, this.open);
  Color get color => playertype == Player.player1 ? Colors.black : Colors.white;

  @override
  bool operator ==(Object other) =>
      other is Piece && other.playertype == playertype && other.index == index;

  @override
  int get hashCode => playertype.hashCode ^ index.hashCode;
}
