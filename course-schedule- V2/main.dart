class Solution {
  Map<int, List<int>> preMap = Map();
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    preMap = createPreMap(numCourses, prerequisites, preMap);
    Set<int> visited = Set();
    for (int c = 0; c < numCourses; c++) {
      if (!dfs(c, visited)) {
        return false;
      }
    }
    return true;
  }

  dfs(int courseNumber, Set<int> visited) {
    if (visited.contains(courseNumber)) {
      return false;
    }
    if (preMap[courseNumber]!.isEmpty) {
      return true;
    }

    visited.add(courseNumber);
    List<int> coursePre = preMap[courseNumber]!;
    while (coursePre.isNotEmpty) {
      if (!dfs(coursePre.first, visited)) {
        return false;
      }
      coursePre.removeAt(0);
      preMap[courseNumber] = coursePre;
    }
    visited.remove(courseNumber);
    return true;
  }

  Map<int, List<int>> createPreMap(int numCourses,
      List<List<int>> prerequisites, Map<int, List<int>> preMap) {
    for (int c = 0; c < numCourses; c++) {
      List<int> coursePre = [];
      prerequisites
          .where((element) => element.first == c)
          .toList()
          .forEach((element) {
        coursePre.add(element.last);
      });
      preMap[c] = coursePre;
    }
    return preMap;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.canFinish(5, [
    [1, 4],
    [2, 4],
    [3, 1],
    [3, 2]
  ]));
}
