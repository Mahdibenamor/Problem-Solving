class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  void reorderList(ListNode? head) {
    if (head == null) {
      return;
    }
    int n = ListNodeCount(head);
    if (n <= 2) {
      return;
    }
    ListNode? list1 = null;
    ListNode? list2 = null;
    ListNode? iterator = head;
    for (int i = 0; i < n; i++) {
      if (i == 0) {
        list1 = iterator;
      }
      if (i == (n ~/ 2) - 1) {
        ListNode? next = iterator?.next;
        iterator?.next = null;
        iterator = next;
        i++;
      }
      if (i == n ~/ 2) {
        list2 = iterator;
      }

      iterator = iterator?.next;
    }
    list2 = reverseOrder(list2);
    head = list1;
    ListNode? iterator1 = list1;
    ListNode? iterator2 = list2;
    ListNode? next2 = iterator2;
    ListNode? next1 = iterator1;

    while (next1 != null && next2 != null) {
      next1 = iterator1?.next;
      next2 = iterator2?.next;
      iterator1?.next = iterator2;
      if (next1 != null) {
        iterator2?.next = next1;
      }
      iterator2 = next2;
      iterator1 = next1;
    }
  }

  int ListNodeCount(ListNode? head) {
    ListNode? tail = head;
    int n = 1;
    while (tail?.next != null) {
      tail = tail?.next;
      n++;
    }
    return n;
  }

  ListNode? reverseOrder(ListNode? head) {
    ListNode? current = head;
    ListNode? prev = null;
    while (current != null) {
      ListNode? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    return prev;
  }
}

main() {
  Solution solution = new Solution();
  //ListNode node5 = ListNode(5, null);
  ListNode node4 = ListNode(4, null);
  ListNode node3 = ListNode(3, node4);
  ListNode node2 = ListNode(2, node3);
  ListNode node1 = ListNode(1, node2);
  solution.reorderList(node1);
}
