class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    int count = getListNodeCount(head);
    if (count == 0) {
      return null;
    }
    int indexToRemove = count - n;
    if (indexToRemove == 0) {
      return head?.next;
    }
    ListNode? iterator = head;
    ListNode? result = iterator;
    int currentIndex = 0;
    while (iterator != null) {
      if (currentIndex == indexToRemove - 1) {
        ListNode? from = iterator;
        ListNode? to = iterator.next?.next;
        from.next = to;
        iterator = to;
      }
      iterator = iterator?.next;
      currentIndex++;
    }
    return result;
  }

  int getListNodeCount(ListNode? head) {
    if (head == null) {
      return 0;
    } else {
      return 1 + getListNodeCount(head.next);
    }
  }
}

main() {
  Solution solution = new Solution();
  ListNode node5 = ListNode(5, null);
  ListNode node4 = ListNode(4, node5);
  ListNode node3 = ListNode(3, node4);
  ListNode node2 = ListNode(2, node3);
  ListNode node1 = ListNode(1, node2);
  print(solution.removeNthFromEnd(node1, 2));
}
