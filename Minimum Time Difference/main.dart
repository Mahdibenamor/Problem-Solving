import 'dart:math';

int findMinDifference(List<String> timePoints) {
  List<int> times = List.empty(growable: true);
  for (var element in timePoints) {
    int h1 = int.parse(element.split(':')[0]);
    int m1 = int.parse(element.split(':')[1]);
    int min1 = (h1 * 60) + m1;
    times.add(min1);
  }

  int timeDifference(int min1, int min2) {
    int diff = (min1 - min2).abs();
    if (diff > 720) {
      diff = 1440 - diff;
    }

    return diff;
  }

  int min = timeDifference(times[0], times[1]);
  for (int i = 0; i < times.length - 1; i++) {
    for (int j = i + 1; j < times.length; j++) {
      if (i != j) {
        int test = timeDifference(times[i], times[j]);
        if (test < min) {
          min = test;
        }
      }
    }
  }

  return min;
}

main() {
  List<String> timePoints = ["00:00", "23:59", "00:00"];
  print(findMinDifference(timePoints));
}
