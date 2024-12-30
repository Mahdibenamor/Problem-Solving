import 'dart:math';

class Solution {
  int maxProfit(List<int> prices) {
    int maxProfit = 0;
    int r = 1;
    int l = 0;
    while (r < prices.length) {
      if (prices[l] >= prices[r]) {
        l = r;
      } else {
        int localProfit = prices[r] - prices[l];
        maxProfit = max(maxProfit, localProfit);
      }
      r++;
    }

    return maxProfit;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.maxProfit([2, 1, 2, 1, 0, 1, 2]));
}
