/*
Given two words (beginWord and endWord), and a dictionary's word list,
 find the length of shortest transformation sequence from beginWord to endWord, such that:

Only one letter can be changed at a time.
Each transformed word must exist in the word list.

Note:

Return 0 if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
Example 1:

Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

Output: 5

Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.
Example 2:

Input:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]

Output: 0

Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.

https://leetcode.com/problems/word-ladder/


The solution seems to be working, but is not very time efficient, which is why submission on Leetcode was not successful. 
*/

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord.count == 0 || endWord.count == 0 ||
            wordList.count == 0 {
                return 0
            }
        
        guard wordList.contains(endWord) else {
            return 0
        }
        
        var wordListCopy = wordList
        var queue = [WordObj(word: beginWord, length: 1)] 
        while !queue.isEmpty {
            let first = queue.first!
            queue.removeFirst()
            for word in wordListCopy {
                var hd = hammingDistance(word, first.word)
                if hd == true {
                    queue.append(WordObj(word: word, length: first.length+1))
                    wordListCopy.removeAll(where: {$0 == word})
                    if word == endWord {
                        return first.length + 1
                    }
                }
            }
        }
        
        return 0
    }
    
    func hammingDistance(_ str: String, _ dest: String) -> Bool {
        
        var hamDist = 0
        for (index, char) in str.enumerated() {
            let destIndex = dest.index(dest.startIndex, offsetBy: index)
            if char != dest[destIndex] {
                hamDist += 1
                if hamDist > 1 {
                    return false
                }
            }
        }
        
        return true
        
    }
}

class WordObj {
    var word: String
    var length: Int
    init(word: String, length: Int) {
        self.word = word
        self.length = length
    }
}

