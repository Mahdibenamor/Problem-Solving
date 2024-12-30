class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode? tail = ListNode();
    ListNode? dummy = tail;
    while (list1 != null && list2 != null) {
      if (list1.val >= list2.val) {
        tail?.next = list2;
        list2 = list2.next;
      } else {
        tail?.next = list1;
        list1 = list1.next;
      }
      tail = tail?.next;
    }
    if (list1 != null && list2 == null) {
      tail?.next = list1;
    }
    if (list1 == null && list2 != null) {
      tail?.next = list2;
    }

    return dummy.next;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.mergeTwoLists(null, null));
}
