class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    Map<int, List<int>> preMap = buildPreMap(numCourses, prerequisites);
    List<int> solution = [];
    Set<int> visited = Set();

    bool dfs(int courseIndex) {
      if (visited.contains(courseIndex)) {
        return false;
      }
      visited.add(courseIndex);
      List<int> cousePre = preMap[courseIndex]!;
      while (cousePre.isNotEmpty) {
        int pre = cousePre.last;
        if (!dfs(pre)) {
          return false;
        }
        cousePre.removeLast();
        preMap[courseIndex] = cousePre;
      }
      if (!solution.contains(courseIndex)) {
        solution.add(courseIndex);
      }
      visited.remove(courseIndex);
      return true;
    }

    for (int c = 0; c < numCourses; c++) {
      visited = Set();
      if (!dfs(c)) {
        return [];
      }
    }

    return solution;
  }

  Map<int, List<int>> buildPreMap(
      int numCourses, List<List<int>> prerequisites) {
    Map<int, List<int>> preMap = Map();

    for (int c = 0; c < numCourses; c++) {
      List<int> coursePre = [];
      prerequisites.forEach((requisit) {
        if (requisit.first == c) {
          coursePre.add(requisit.last);
        }
      });
      preMap[c] = coursePre;
    }

    return preMap;
  }
}

void main() {
  Solution solution = Solution();
  // print(solution.findOrder(4, [
  //   [1, 0],
  //   [2, 0],
  //   [3, 1],
  //   [3, 2]
  // ]));

  print(solution.findOrder(1, []));
}
