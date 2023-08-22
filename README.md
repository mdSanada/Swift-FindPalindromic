# Swift-FindPalindromic

## Palindrome Subsequence with Special Positions

A palindrome is a string that reads the same forwards as backwards. For example, "BANANAB" is a palindrome, while "BANANAS" is not. In this problem, we're interested in a more complex scenario.

### Problem Statement

Given a string **S**, we want to find a subsequence that is a palindrome. A subsequence is a string that can be obtained by removing zero or more characters from the original string. For example, "ANNA" is a subsequence of "BANANAS".

Additionally, we are given a set of positions in **S**, referred to as special positions. Your task is to find the size of the longest palindrome subsequence that includes the maximum number of special positions. If there are multiple subsequences that maximize the number of special positions, you should print the size of the largest one.

### Input

The input consists of two lines. The first line contains an uppercase string **S** with a length between 1 and 2000 characters. The second line contains an integer **N** (0 ≤ **N** ≤ length of **S**), indicating the number of special positions we're interested in. This is followed by **N** distinct integers between 1 and length of **S**, inclusive, representing the special positions in **S**.

### Output

Your program should output a single integer, representing the size of the largest possible palindrome subsequence, as defined above.

### Example

**Input:**
```
ACDAAACX
3 2 8
```

**Output:**
```
5
```

In this example, the string is "ACDAAACX" and the special positions are at indices 2, 3, and 8. The largest palindrome subsequence that includes these special positions is "CAAAC", which has a length of 5.

### Usage

```
    Palindromic().find(_ str: String, special positions: [Int]) -> Int 
```

