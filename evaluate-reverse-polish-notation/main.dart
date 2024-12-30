import 'dart:collection';

class Solution {
  int evalRPN(List<String> tokens) {
    Queue<int> stack = Queue();
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '+' ||
          tokens[i] == '-' ||
          tokens[i] == '*' ||
          tokens[i] == '/') {
        int b = stack.removeLast();
        int a = stack.removeLast();
        stack.addLast(processOperation(a, b, tokens[i]));
      } else {
        stack.addLast(int.parse(tokens[i]));
      }
    }
    return stack.first;
  }

  int processOperation(int a, int b, String operation) {
    switch (operation) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a ~/ b;
    }
    return 0;
  }

  int evalRPN1(List<String> tokens) {
    if (tokens.length == 0) {
      return 0;
    }
    int aIndex = 0;
    int bIndex = 1;
    int operationIndex = 2;
    while (tokens.length != 1) {
      if (tokens[operationIndex] == '+' ||
          tokens[operationIndex] == '-' ||
          tokens[operationIndex] == '*' ||
          tokens[operationIndex] == '/') {
        int result = processOperation(int.parse(tokens[aIndex]),
            int.parse(tokens[bIndex]), tokens[operationIndex]);
        tokens[aIndex] = result.toString();
        tokens.removeAt(bIndex);
        tokens.removeAt(operationIndex - 1);
        aIndex = 0;
        bIndex = 1;
        operationIndex = 2;
      } else {
        aIndex++;
        bIndex++;
        operationIndex++;
      }
    }
    return int.parse(tokens.first);
  }
}

main() {
  Solution s = Solution();
  print(s.evalRPN(
      ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]));
}
