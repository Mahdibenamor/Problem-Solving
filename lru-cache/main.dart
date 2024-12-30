import 'dart:math';

class LRUCache {
  Map<int, int> prev = Map();
  Map<int, int> next = Map();
  Map<int, int> map = Map();
  int tail = -1;
  int head = pow(10, 5).toInt() + 1;
  int capacity = 0;
  LRUCache(int capacity) {
    prev[head] = tail;
    next[tail] = head;
    this.capacity = capacity;
  }

  int get(int key) {
    if (!map.containsKey(key)) {
      return -1;
    } else {
      int value = removeElement(key);
      pushAtHead(key, value);
    }
    return map[key]!;
  }

  void pushAtHead(int key, int value) {
    int headprev = prev[head]!;
    next[headprev] = key;
    prev[key] = headprev;
    next[key] = head;
    prev[head] = key;
    map[key] = value;
  }

  int removeElement(int key) {
    int nextElement = next[key]!;
    int prevElement = prev[key]!;
    next[prevElement] = nextElement;
    prev[nextElement] = prevElement;
    int value = map[key]!;
    map.remove(key);
    return value;
  }

  void put(int key, int value) {
    if (map.containsKey(key)) {
      removeElement(key);
      pushAtHead(key, value);
      return;
    }
    if (map.length < capacity) {
      pushAtHead(key, value);
      return;
    }
    int leastElement = next[tail]!;
    removeElement(leastElement);
    pushAtHead(key, value);
  }
}

main() {
  LRUCache cache = LRUCache(2);
  print(cache.get(2));
  cache.put(2, 6);
  print(cache.get(1));
  cache.put(1, 5);
  cache.put(1, 2);
  print(cache.get(1));
  print(cache.get(2));
}
