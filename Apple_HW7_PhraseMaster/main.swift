//
//  main.swift
//  Apple_HW7_PhraseMaster
//
//  Created by Reid Nolan on 12/8/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

//validateStringInput
func validateStringInput(prompt: String) -> String {
    while (true) {
        print(prompt)
        let userInput = readLine()!
        if(userInput.count > 0) {
            return userInput
        } else {
            print("Error! No Input.")
        }
    }
}

//validateIntInput
func validateIntInput(prompt: String) -> Int {
    while (true) {
        print(prompt)
        let inputInt = Int(readLine()!)
        if (inputInt != nil ) {
            return inputInt!
        } else {
            print("Error! Invalid input. Value must be an integer.")
        }
    }
}

//print program header
print("Apple_HW7_PhraseMaster\n")

//initialize variables
var progRunCount: Int = 0
var processedPhrase: String = ""
var phrase = Phrase(contents: " ")

//loop for menu selections
while(true) {
    var menuSelection: Int = 0
    
    //if first iteration (i.e. runcount == 0) then prompt for phrase input, else promt to make menu selection
    if (progRunCount == 0) {
        menuSelection = 1
    } else {
        menuSelection = validateIntInput(prompt: "Choose an option:")
    }
    switch(menuSelection) {
        case 1:
            phrase = Phrase(contents: validateStringInput(prompt: "Enter a phrase:"))
            //repeat input back to user
            processedPhrase = getPhraseContents(phrase: phrase)
            print("You entered: \n \(processedPhrase)")
            //give user stats for phrase
            processedPhrase = getPhraseStats(phrase: phrase)
            print("phraseStats: \n \(processedPhrase)")
            print()
        case 2:
            processedPhrase = convertToLower(phrase: phrase)
            print("convertToLower: \n \(processedPhrase)")
        case 3:
            processedPhrase = convertToUpper(phrase: phrase)
            print("convertToUpper: \n \(processedPhrase)")
        case 4:
            processedPhrase = reverseWords(phrase: phrase)
            print("reverseWords: \n \(processedPhrase)")
        case 5:
            processedPhrase = sortAlphabetically(phrase: phrase)
            print("sortAlphabeticaly: \n \(processedPhrase)")
        case 6:
            //case for rotN shift
            let n: Int = validateIntInput(prompt:"Enter amount of shift: ")
            processedPhrase = applyRotN(phrase: phrase, n: n)
            print("applyRot13: \n \(processedPhrase)")
        case 7:
            //case for pigLatin
            processedPhrase = applyPigLatin(phrase: phrase)
            print("applyPigLatin: \n \(processedPhrase)")
        case 0:
            exit(1)
        default:
            print("Error! Invalid selection.")
    }
    
    //re-displays main menu after every six program iterations
    if (progRunCount % 6 == 0 || progRunCount == 0) {
    //print main menu to console
    print("Main Menu")
    print("1. newPhrase")
    print("2. convertToLower")
    print("3. convertToUpper")
    print("4. reverseWords")
    print("5. sortAlphabetically")
    print("6. applyRotN")
    print("7. applyPigLatin")
    print("0. quit")
    } else { /*doNothing*/ }
    
    //increment program iteration counter
    progRunCount += 1
}
