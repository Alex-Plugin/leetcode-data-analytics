# LeetCode 1: Two Sum
# Task: Find the indices of two numbers in a list 'nums' that add up to 'target'.
# Approach: Use a dictionary to store seen numbers and their indices for quick lookup.

from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        num_dict = {}
        for i, num in enumerate(nums):
            delta = target - num
            if delta in num_dict:
                return [num_dict[delta], i]
            num_dict[num] = i


if __name__ == "__main__":
    solution = Solution()
    nums = [2, 7, 11, 15]
    target = 9
    print(solution.twoSum(nums, target))
