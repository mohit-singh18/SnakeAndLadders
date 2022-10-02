import 'dart:math';
import 'package:snakeandladder/path.dart';

// ignore: camel_case_types
class Snake_Ladder {
  Path path = Path();
  var rnd = Random();
  List<int> snakes = [];
  List<int> ladders = [];
  Snake_Ladder() {
    int num = 0;
    List<int> snake = [];
    List<int> ladder = [];
    for (int i = 0; i < 6; i++) {
      num = rnd.nextInt(36);
      while (true) {
        if (num == 30 || num == 0) {
          num = rnd.nextInt(36);
          continue;
        }
        if (snake.contains(num)) {
          num = rnd.nextInt(36);
          continue;
        }
        break;
      }
      snake.add(num);
    }
    for (int i = 0; i < 6; i++) {
      num = rnd.nextInt(36);
      while (true) {
        if (num == 30 || num == 0) {
          num = rnd.nextInt(36);
          continue;
        }
        if (snake.contains(num) || ladder.contains(num)) {
          num = rnd.nextInt(36);
          continue;
        }
        break;
      }
      ladder.add(num);
    }
    for (var i in path.path) {
      if (ladder.contains(i)) {
        ladders.add(i);
      }
      if (snake.contains(i)) {
        snakes.add(i);
      }
    }
  }
}
