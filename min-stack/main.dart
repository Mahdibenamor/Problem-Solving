import 'dart:math';

class MinStack {
  List<int> values = [];
  List<int> minsIndexs = [];
  num min = pow(2, 31) + 1;
  MinStack() {}

  void push(int val) {
    if (minsIndexs.isEmpty) {
      minsIndexs.add(values.length);
    } else {
      int lastKnownMin = values[minsIndexs.last];
      if (lastKnownMin > val) {
        minsIndexs.add(values.length);
      }
    }
    values.add(val);
  }

  void pop() {
    int lastElementIndex = values.length - 1;
    if (minsIndexs.last == lastElementIndex) {
      minsIndexs.removeLast();
    }
    values.removeLast();
  }

  int top() {
    return values.last;
  }

  int getMin() {
    return values[minsIndexs.last];
  }
}

main() {
  MinStack stack = new MinStack();
  stack.push(6);
  stack.push(6);
  stack.push(7);

  stack.top();
  stack.pop();
  stack.getMin();

  stack.pop();
  stack.getMin();
  stack.pop();

  stack.push(7);
  stack.top();
  stack.getMin();

  stack.push(-8);
  stack.top();
  stack.getMin();

  stack.pop();
  stack.getMin();

  bool test = true;
}
