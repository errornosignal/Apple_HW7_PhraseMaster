//
//  Phrase.swift
//  Apple_HW7_PhraseMaster
//
//  Created by Reid Nolan on 12/8/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

/* if statement at Lines 102 and 147 "if (!isAlpha(char: newWord[i])) " gives out-of-range errors when either sorting alphabetically or applying pig latin. this only occurs if word contains more than 1 non-alpha */

import Foundation

//Phrase struct
struct Phrase {
    var contents: String
}

//getPhraseContents
func getPhraseContents(phrase: Phrase) -> String {
    let newUserPhrase = String(describing: phrase.contents)
    return newUserPhrase
}

//getphraseStats
func getPhraseStats(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    let wordArray: [String] = newUserPhrase.components(separatedBy: " ")
    let charArray: [Character] = Array(newUserPhrase)
    var spaceArray: [Character] = []
    var lowerArray: [Character] = []
    var upperArray: [Character] = []
    var digitArray: [Character] = []
    var punctArray: [Character] = []
    var countArray: [Int] = []
    
    //append chars to arrays by type
    for char in charArray {
        if (char == " ") {
            spaceArray.append(char)
        } else if (isLower(char: char)) {
            lowerArray.append(char)
        } else if (isUpper(char: char)) {
            upperArray.append(char)
        } else if (isDigit(char: char)) {
            digitArray.append(char)
        } else if (isPunct(char: char)) {
            punctArray.append(char)
        }
    }
    
    //add char type counts to int array
    countArray.append(spaceArray.count)
    countArray.append(lowerArray.count)
    countArray.append(upperArray.count)
    countArray.append(digitArray.count)
    countArray.append(punctArray.count)
    
    /*
    spaceArray.count is countArray[0]
    lowerArray.count  is countArray[1]
    upperArray.count  is countArray[2]
    digitArray.count is countArray[3]
    punctArray.count is countArray[4]
    */
    
    return ("  words: " + (String(wordArray.count)) + "\n isSpace: " + String(countArray[0]) + "\n isLower: " + String(countArray[1]) + "\n isUpper: " + String(countArray[2]) + "\n isDigit: " + String(countArray[3]) + "\n isPunct: " + String(countArray[4]))
}
    
//convertToLower
func convertToLower(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    return newUserPhrase.lowercased()
}
    
//convertToUpper
func convertToUpper(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    return newUserPhrase.uppercased()
}
    
//reverseWords
func reverseWords(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    let wordArray: [String] = newUserPhrase.components(separatedBy: " ")
    let reversedNames: [String] = wordArray.reversed()
    return String(describing: reversedNames.joined(separator:" "))
}

//sortAlphabetically
func sortAlphabetically(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    let wordArray: [String] = newUserPhrase.components(separatedBy: " ")
    var newWordArray: [String] = []
    
    //elimintate all but alpha and spaces
    for word in wordArray {
        let newWord = Array(word)
        var newWord2: [Character] = []
        for (_, str) in newWord.enumerated() {
            if (!isAlpha(char: str) && !isSpace(char: str)) {
                //room for rent
            } else {
                newWord2.append(str)
            }
        }
        newWordArray.append(String(newWord2).lowercased())
    }
    
    //sort on values
    let sortedNames = newWordArray.sorted(by: <)
    return String(describing: sortedNames.joined(separator:" "))
}

/*found a helpful start on https://stackoverflow.com/questions/37756430/how-to-implement-a-rot13-function-in-swift, worked it in to pass the struct and in int to it and added rotN capability */
//applyRotN
func applyRotN(phrase: Phrase, n: Int) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    var key = [Character: Character]()
    let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let lowercase = Array("abcdefghijklmnopqrstuvwxyz")
    //clever way to shift elements
    for i in 0 ..< 26 {
        key[uppercase[i]] = uppercase[(i + n) % 26]
        key[lowercase[i]] = lowercase[(i + n) % 26]
    }
    return String(newUserPhrase.map { key[$0] ?? $0 })
}

//applyPigLatin
func applyPigLatin(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    let wordArray: [String] = newUserPhrase.lowercased().components(separatedBy: " ")
    var newWordArray: [String] = []
    var pigLatinArray: [String] = []
    
    //if single character return that char
    if newUserPhrase.count == 1 {
        return newUserPhrase
    }
    
    //elimintate all but alpha and spaces
    for word in wordArray {
        let newWord = Array(word)
        var newWord2: [Character] = []
        for (_, str) in newWord.enumerated() {
            if (!isAlpha(char: str) && !isSpace(char: str) && !isDigit(char: str) && !isPunct(char: str)) {
                
            } else {
                newWord2.append(str)
            }
        }
        newWordArray.append(String(newWord2).lowercased())
    }
    
    //do pig substitutions
    for word in newWordArray {
        var newWord = Array(word)
        var consonantArray: [Character] = []
        var tempStr: String = ""
        
        //move consonants up to first vowel from beginning of word to end of word and append with 'ay' suffix
        for (i, str) in newWord.enumerated() {
            if(!isVowel(char: newWord[i])) {
                consonantArray.append(str)
                tempStr = String(consonantArray)
            } else { break }
            tempStr += "ay"
        }
        
        //add 'yay' suffix for words that begin with vowels
        if (isVowel(char: newWord[0])) {
            newWord += "yay"
        } else /*if (newWord.count > 0)*/{
            newWord += tempStr
        }
        
        //remove remaining consonants before 1st vowel
        for i in newWord {
            if (!isVowel(char: i)){
                newWord.remove(at: newWord.startIndex)
            } else { break }
        }
        
        //add pig-latined word into array
        pigLatinArray.append(String(newWord))
        
        //remove 'ay's that got left behind from removal of digits, punct, or special
        for (i, str) in pigLatinArray.enumerated() {
            if (str == "ay") {
                pigLatinArray.remove(at: i)
            }
        }
    }

    //join array element into string
    let convertedString = pigLatinArray.joined(separator: " ")
    return convertedString
}

/* CHARACTER TESTS */
/* I went ahead and made all of these "isXXX" character functions with info from http://en.cppreference.com/w/cpp/string/byte/ispunct sice  figured I could re-use them on the upcoming concordance */

//isSpace
func isSpace(char: Character) -> Bool {
    switch char {
    case "\u{0009}": /* tab (\t) */
        return true
    case "\u{000A}"..."\u{000D}":  /* whitespaces (\n,\v,\f,\r) */
        return true
    case "\u{020}": /* space */
        return true
    default:
        return false
    }
}

//isBlank
func isBlank(char: Character) -> Bool {
    switch char {
    case "\u{0009}": /* tab (\t) */
        return true
    case "\u{020}": /* space */
        return true
    default:
        return false
    }
}

//isDigit
func isDigit(char: Character) -> Bool {
    switch char {
    case "\u{0030}"..."\u{0039}": /* 0123456789 */
        return true
    default:
        return false
    }
}

//isAlphaNumeric
func isAlphaNumeric (char: Character) -> Bool {
    switch char {
    case "\u{0041}"..."\u{005A}": /* ABCDEFGHIJKLMNOPQRSTUVWXYZ */
        return true
    case "\u{0061}"..."\u{007A}": /* abcdefghijklmnopqrstuvwxyz */
        return true
    case "\u{0030}"..."\u{0039}": /* 0123456789 */
        return true
    default:
        return false
    }
}

//isAlpha
func isAlpha(char: Character) -> Bool {
    switch char {
    case "\u{0041}"..."\u{005A}": /* ABCDEFGHIJKLMNOPQRSTUVWXYZ */
        return true
    case "\u{0061}"..."\u{007A}": /* abcdefghijklmnopqrstuvwxyz */
        return true
    default:
        return false
    }
}

//isLower
func isLower(char: Character) -> Bool {
    switch char {
    case "\u{0061}"..."\u{007A}": /* abcdefghijklmnopqrstuvwxyz */
        return true
    default:
        return false
    }
}

//isUpper
func isUpper(char: Character) -> Bool {
    switch char {
    case "\u{0041}"..."\u{005A}": /* ABCDEFGHIJKLMNOPQRSTUVWXYZ */
        return true
    default:
        return false
    }
}

//isVowel
func isVowel(char: Character) -> Bool {
    switch char {
        case "\u{0061}", "\u{0065}", "\u{0069}", "\u{006f}", "\u{0075}", "\u{0079}": /* AEIOUY */
            return true
        default:
            return false
    }
}

//isPunct
func isPunct(char: Character) -> Bool {
    switch char {
    case "\u{0021}"..."\u{002F}": /* !"#$%&'()*+,-./ */
        return true
    case "\u{003a}"..."\u{0040}": /* :;<=>?@ */
        return true
    case "\u{005B}"..."\u{0060}": /* [\]^_` */
        return true
    case "\u{007B}"..."\u{007E}": /* {|}~ */
        return true
    default:
        return false
    }
}
