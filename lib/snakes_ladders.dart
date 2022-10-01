import 'dart:math';

// ignore: camel_case_types
class Snake_Ladder {
  var rnd = Random();
  List<int> snakes = [];
  List<int> ladders = [];
  Snake_Ladder() {
    print('hi');
    int num = 0;
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
    snakes.sort();
    snakes = List.from(snakes.reversed);
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
    ladders.sort();
    ladders = List.from(ladders.reversed);
  }
}
