class Path {
  final List<int> path = [
    30,
    31,
    32,
    33,
    34,
    35,
    29,
    28,
    27,
    26,
    25,
    24,
    18,
    19,
    20,
    21,
    22,
    23,
    17,
    16,
    15,
    14,
    13,
    12,
    6,
    7,
    8,
    9,
    10,
    11,
    5,
    4,
    3,
    2,
    1,
    0
  ];
  Map<int, int> pth() {
    Map<int, int> pth1 = {};
    for (int i = 0; i < path.length; i++) {
      pth1[path[i]] = i;
    }

    return pth1;
  }
}
