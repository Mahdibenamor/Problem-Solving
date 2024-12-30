class TimeMap {
  Map<String, List<(int, String)>> _objs = Map();
  TimeMap() {}

  void set(String key, String value, int timestamp) {
    if (!_objs.containsKey(key)) {
      _objs[key] = [(timestamp, value)];
    } else {
      List<(int, String)> values = _objs[key]!;
      values.add((timestamp, value));
      _objs[key] = values;
    }
  }

  String get(String key, int timestamp) {
    if (!_objs.containsKey(key)) return "";
    List<(int, String)> values = _objs[key]!;
    if (values.isEmpty) return "";
    int s = 0;
    int e = values.length - 1;
    String res = "";
    while (s <= e) {
      int mid = (s + e) ~/ 2;
      if (values[mid].$1 == timestamp) {
        return values[mid].$2;
      }
      if (values[mid].$1 < timestamp) {
        res = values[mid].$2;
        s = mid + 1;
      }
      if (values[mid].$1 > timestamp) {
        e = mid - 1;
      }
    }

    return res;
  }
}

main() {}
