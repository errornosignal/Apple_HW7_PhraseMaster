//
//  main.swift
//  Apple_HW7_PhraseMaster
//
//  Created by Reid Nolan on 12/8/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

//get user string input
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

//get user int input
func validateIntInput(prompt: String) -> Int {
    while (true) {
        print(prompt);
        let inputInt = Int(readLine()!)
        
        if (inputInt != nil ) {
            return inputInt!;
        }
        else {
            print("Error! Invalid input. Value must be an integer.");
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
    
    //get user selection
    var menuSelection: Int = 0
    if (progRunCount == 0) {
        menuSelection = 1
    } else {
        menuSelection = validateIntInput(prompt: "Choose an option:")
    }
    switch(menuSelection) {
        case 1:
            phrase = Phrase(contents: validateStringInput(prompt: "Enter a phrase:"))
            processedPhrase = getPhraseContents(phrase: phrase)
            print("You entered: \(processedPhrase)")
        case 2:
            processedPhrase = convertToLower(phrase: phrase)
            print("convertToLower: \(processedPhrase)")
        case 3:
            processedPhrase = convertToUpper(phrase: phrase)
            print("convertToUpper: \(processedPhrase)")
        case 4:
            processedPhrase = reverseWords(phrase: phrase)
            print("reverseWords: \(processedPhrase)")
        case 5:
            processedPhrase = sortAlphabetically(phrase: phrase)
            print("sortAlphabeticaly: \(processedPhrase)")
        case 6:
            let n: Int = validateIntInput(prompt:"Enter amount of shift: ")
            processedPhrase = applyRotN(phrase: phrase, n: n)
            print("applyRot13: \(processedPhrase)")
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
    print("0. quit")
    } else { /*doNothing*/ }
    
    progRunCount += 1
}
