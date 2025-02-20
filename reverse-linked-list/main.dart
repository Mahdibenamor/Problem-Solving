class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? curr = head;
    while (curr != null) {
      ListNode? next = curr?.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    return prev;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.reverseList(null));
}
