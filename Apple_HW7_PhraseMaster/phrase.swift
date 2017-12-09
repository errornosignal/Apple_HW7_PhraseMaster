//
//  Phrase.swift
//  Apple_HW7_PhraseMaster
//
//  Created by Reid Nolan on 12/8/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

struct Phrase {
    var contents: String
}

//getPhraseContents
func getPhraseContents(phrase: Phrase) -> String {
    let newUserPhrase = String(describing: phrase.contents)
    return newUserPhrase
}
    
//convertToLower
func convertToLower(phrase: Phrase) -> String {
    let newUserPhrase = String(describing: phrase.contents)
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
    return String(newUserPhrase.reversed())
    
    //TODO: need to preserve words in string before returning phrase backwards
    
    //        //initialize counter variable for word count in string
    //        var wordCount: Int = 0;
    //
    //        //count words in string using space as a delimiter
    //        for (int i = 0; newUserPhrase[i] != '\0'; i++) {
    //            if (newUserPhrase[i] == " ") {
    //                wordCount++;
    //            }
    //        }
    //        //increment one more time so counter reflects actual qty of words in string
    //        wordCount++;
    //
    //        //set dynamic array and initialize elements
    //        string *words = new string[wordCount];
    //        for (int j = 0; j < wordCount; j++) {
    //            words[j] = '\0';
    //        }
    //
    //        //make a buffer string
    //        string stringBuffer;
    //        //insert string into stream
    //        stringstream stringStream(newUserPhrase);
    //        //set up vector for tokens
    //        vector<string> tokens;
    //
    //        //drop vector tokens into array
    //        for (int i = 0; i < wordCount; i++) {
    //            while (stringStream >> stringBuffer) {
    //                tokens.push_back(stringBuffer);
    //                words[i] = stringBuffer;
    //                i++;
    //            }
    //        }
    //
    //        //read array elemnets backwards
    //        for (int q = wordCount-1; q >= 0; q--) {
    //            cout << words[q] << " ";
    //        }
    //        cout << endl;
    //
    //        //delete dynamic array
    //        delete[] words;
}

//sortAlphabetically
func sortAlphabetically(phrase: Phrase) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    return String(describing: newUserPhrase.sorted())
}

//applyRotN
func applyRotN(phrase: Phrase, n: Int) -> String {
    let newUserPhrase: String = String(describing: phrase.contents)
    var key = [Character: Character]()
    let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let lowercase = Array("abcdefghijklmnopqrstuvwxyz")
    for i in 0 ..< 26 {
        key[uppercase[i]] = uppercase[(i + n) % 26]
        key[lowercase[i]] = lowercase[(i + n) % 26]
    }
    return String(newUserPhrase.map { key[$0] ?? $0 })
}
