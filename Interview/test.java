//
//  test.java
//  Interview
//
//  Created by LuckyXYJ on 2025/7/2.
//

public class test {
    
    // 合并k个升序链表
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) {
            return null;
        }
        return mergeKLists(lists, 0, lists.length - 1);
    }

    // 递归分治合并
    private ListNode mergeKLists(ListNode[] lists, int left, int right) {
        if (left == right) {
            return lists[left];
        }
        int mid = left + (right - left) / 2;
        ListNode l1 = mergeKLists(lists, left, mid);
        ListNode l2 = mergeKLists(lists, mid + 1, right);
        return mergeTwoLists(l1, l2);
    }

    // 合并两个有序链表
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode curr = dummy;
        while (l1 != null && l2 != null) {
            if (l1.val < l2.val) {
                curr.next = l1;
                l1 = l1.next;
            } else {
                curr.next = l2;
                l2 = l2.next;
            }
            curr = curr.next;
        }
        if (l1 != null) curr.next = l1;
        if (l2 != null) curr.next = l2;
        return dummy.next;
    }
    
    // 两数之和
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];
            if (map.containsKey(complement)) {
                return new int[] { map.get(complement), i };
            }
            map.put(nums[i], i);
        }
        throw new IllegalArgumentException("No two sum solution");
                }
    
    // 数组删除等于某个值的元素
    public int removeElement(int[] nums, int val) {
        int k = 0; // k是新数组的长度
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != val) {
                nums[k++] = nums[i];
            }
        }
        return k; // 返回新数组的长度
    }
    
    // 删除链表中的节点
    public ListNode deleteNode(ListNode head, int val) {
        if (head == null) return null;
        if (head.val == val) return head.next; // 删除头节点
        ListNode current = head;
        while (current.next != null && current.next.val != val) {
            current = current.next;
        }
        if (current.next != null) {
            current.next = current.next.next; // 删除目标节点
        }
        return head;
    }
    
    // 快速排序算法
    public void quickSort(int[] arr, int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);
            quickSort(arr, low, pi - 1); // 左边
            quickSort(arr, pi + 1, high); // 右边
        }
    }
    
    private int partition(int[] arr, int low, int high) {
        int pivot = arr[high]; // 选择最后一个元素作为基准
        int i = (low - 1); // 小于基准的元素的索引
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) { // 如果当前元素小于基准
                i++;
                // 交换 arr[i] 和 arr[j]
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        // 交换 arr[i + 1] 和 arr[high] (或基准)
        int temp = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp;
        return i + 1; // 返回基准的索引
  
    }
    
    // 删除链表中倒数第n个节点
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        ListNode first = dummy;
        ListNode second = dummy;
        
        // 移动first指针，使其与second指针相隔n个节点
        for (int i = 0; i <= n; i++) {
            first = first.next;
        }
        
        // 移动first和second指针，直到first到达链表末尾
        while (first != null) {
            first = first.next;
            second = second.next;
        }
        
        // 删除目标节点
        second.next = second.next.next;
        
        return dummy.next; // 返回新的头节点
    }
}
