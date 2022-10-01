import 'dart:math';

// ignore: camel_case_types
class Snake_Ladder {
  late List<int> snakes;
  late List<int> ladders;
  Snake_Ladder() {
    var rnd = Random();
    int num;
    snakes = [];
    for (int i = 0; i < 6; i++) {
      num = rnd.nextInt(36);
      while (true) {
        if (num == 30 || num == 0) {
          num = rnd.nextInt(36);
          continue;
        }
        if (snakes.contains(num)) {
          num = rnd.nextInt(36);
          continue;
        }
        break;
      }
      snakes.add(num);
    }
    ladders = [];
    for (int i = 0; i < 6; i++) {
      num = rnd.nextInt(36);
      while (true) {
        if (num == 30 || num == 0) {
          num = rnd.nextInt(36);
          continue;
        }
        if (snakes.contains(num) || ladders.contains(num)) {
          num = rnd.nextInt(36);
          continue;
        }
        break;
      }
      ladders.add(num);
    }
  }
}
