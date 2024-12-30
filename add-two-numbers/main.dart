class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode();
    ListNode? tail = dummy;
    ListNode? p1 = l1;
    ListNode? p2 = l2;
    int rest = 0;
    while (!(p1 == null && p2 == null)) {
      int sum = rest;
      if (p1 != null) sum = sum + p1.val;
      if (p2 != null) sum = sum + p2.val;
      tail?.next = ListNode(sum % 10);
      rest = sum ~/ 10;
      tail = tail?.next;
      p2 = p2?.next;
      p1 = p1?.next;
    }
    if (rest != 0) {
      tail?.next = ListNode(rest);
    }
    return dummy.next;
  }
}

void main() {
  Solution solution = Solution();
  ListNode node7 = ListNode(9);
  ListNode node6 = ListNode(9, node7);
  ListNode node5 = ListNode(9, node6);
  ListNode node4 = ListNode(9, node5);
  ListNode node3 = ListNode(9, node4);
  ListNode node2 = ListNode(9, node3);
  ListNode node1 = ListNode(9, node2);

  ListNode node13 = ListNode(9);
  ListNode node12 = ListNode(9, node13);
  ListNode node11 = ListNode(9, node12);
  ListNode node10 = ListNode(9, node11);

  print(solution.addTwoNumbers(node10, node1));
}
