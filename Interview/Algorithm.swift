//
//  Algorithm.swift
//  Interview
//
//  Created by LuckyXYJ on 2025/6/28.
//

import Foundation
import UIKit

// 单链表节点定义
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Algorithm {
    
    @MainActor static let shareInstance = Algorithm()
    
    private init() {}
        
    func test() {
        
    }
}

extension Algorithm {
    // 字符串反转算法，自己实现不要用reversed
    func reverseString(_ str: String) -> String {
        var reversedString = ""
        for character in str {
            reversedString = "\(character)" + reversedString
        }
        return reversedString
    }
    
    // 字符串数组反转, 数组首尾指针交换的方式
    func reverseStringArray(_ array: [String]) -> [String] {
        var reversedArray = array
        var left = 0
        var right = reversedArray.count - 1
        
        while left < right {
            // 交换首尾元素
            let temp = reversedArray[left]
            reversedArray[left] = reversedArray[right]
            reversedArray[right] = temp
            
            // 移动指针
            left += 1
            right -= 1
        }
        
        return reversedArray
    }
}

extension Algorithm {
    // 链表翻转
    func reverseLinkedList(head: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current = head
        
        while current != nil {
            let next = current?.next // 保存下一个节点
            current?.next = previous // 翻转当前节点的指针
            previous = current // 移动 previous 指针到当前节点
            current = next // 移动到下一个节点
        }
        
        return previous // 返回新的头节点
    }
}

extension Algorithm {
    // 两个有序数组合并
    func mergeSortedArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
        var mergedArray = [Int]()
        var i = 0
        var j = 0
        
        while i < array1.count && j < array2.count {
            if array1[i] < array2[j] {
                mergedArray.append(array1[i])
                i += 1
            } else {
                mergedArray.append(array2[j])
                j += 1
            }
        }
        
        // 添加剩余元素
        while i < array1.count {
            mergedArray.append(array1[i])
            i += 1
        }
        
        while j < array2.count {
            mergedArray.append(array2[j])
            j += 1
        }
        
        return mergedArray
    }
}

extension Algorithm {
    // 二分查找
    func binarySearch(_ array: [Int], target: Int) -> Int? {
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if array[mid] == target {
                return mid // 找到目标元素，返回索引
            } else if array[mid] < target {
                left = mid + 1 // 在右半部分继续查找
            } else {
                right = mid - 1 // 在左半部分继续查找
            }
        }
        
        return nil // 未找到目标元素
    }
}

extension Algorithm {
    // 快速排序
    func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2] // 选择中间元素作为基准
        let less = array.filter { $0 < pivot } // 小于基准的元素
        let equal = array.filter { $0 == pivot } // 等于基准的元素
        let greater = array.filter { $0 > pivot } // 大于基准的元素
        
        return quickSort(less) + equal + quickSort(greater) // 递归排序并合并结果
    }
}

extension Algorithm {
    // 冒泡排序
    func bubbleSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        
        for i in 0..<sortedArray.count {
            for j in 0..<(sortedArray.count - i - 1) {
                if sortedArray[j] > sortedArray[j + 1] {
                    // 交换元素
                    let temp = sortedArray[j]
                    sortedArray[j] = sortedArray[j + 1]
                    sortedArray[j + 1] = temp
                }
            }
        }
        
        return sortedArray
    }
}

extension Algorithm {
    // 查找第一个只出现一次的字符
    func firstNonRepeatingCharacter(_ str: String) -> Character? {
        var characterCount = [Character: Int]()
        
        // 统计每个字符出现的次数
        for character in str {
            characterCount[character, default: 0] += 1
        }
        
        // 查找第一个只出现一次的字符
        for character in str {
            if let count = characterCount[character], count == 1 {
                return character
            }
        }
        
        return nil // 如果没有找到，返回 nil
    }
}

extension Algorithm {
    // 查找两个子视图的共同父视图
    @MainActor func commonSuperview(_ view1: UIView, _ view2: UIView) -> UIView? {
        var superview1: UIView? = view1.superview
        var superview2: UIView? = view2.superview
        
        // 使用集合来存储第一个视图的所有父视图
        var superviewsOfView1 = Set<UIView>()
        
        while let superview = superview1 {
            superviewsOfView1.insert(superview)
            superview1 = superview.superview
        }
        
        // 查找第二个视图的父视图是否在第一个视图的父视图集合中
        while let superview = superview2 {
            if superviewsOfView1.contains(superview) {
                return superview // 找到共同的父视图
            }
            superview2 = superview.superview
        }
        
        return nil // 如果没有找到共同的父视图，返回 nil
    }
}

extension Algorithm {
    // 求无序数组当中的中位数
    func findMedian(_ array: [Int]) -> Double? {
        guard !array.isEmpty else { return nil }
        
        let sortedArray = array.sorted()
        let count = sortedArray.count
        
        if count % 2 == 1 {
            // 奇数个元素，返回中间的元素
            return Double(sortedArray[count / 2])
        } else {
            // 偶数个元素，返回中间两个元素的平均值
            let midIndex = count / 2
            return Double(sortedArray[midIndex - 1] + sortedArray[midIndex]) / 2.0
        }
    }
}

// 两数之和
extension Algorithm {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int]? {
        var numToIndex = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            let complement = target - num
            
            if let complementIndex = numToIndex[complement] {
                return [complementIndex, index] // 找到两个数的索引
            }
            
            numToIndex[num] = index // 存储当前数及其索引
        }
        
        return nil // 如果没有找到，返回 nil
    }
}

// 数组删除等于某个值的元素
extension Algorithm {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        
        for num in nums {
            if num != val {
                nums[index] = num // 保留不等于 val 的元素
                index += 1
            }
        }
        
        return index // 返回新数组的长度
    }
}

