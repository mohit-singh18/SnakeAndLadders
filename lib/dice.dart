import 'dart:math';

class Dice {
  var rnd = Random();
  late int num;
  int rolldice() {
    num = rnd.nextInt(6) + 1;
    return num;
  }
}
