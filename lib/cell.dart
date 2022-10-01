import 'package:flutter/material.dart';
import 'pieces.dart';
import 'Index.dart';

class Cell {
  List<Piece> piece;
  Index index;
  int numpieces;
  Cell(this.index, this.piece, this.numpieces);
  Color get color {
    return index.color;
  }
}
