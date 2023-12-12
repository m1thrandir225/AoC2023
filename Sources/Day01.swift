//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 12.12.23.
//

import Foundation

extension String {
    var isNumber: Bool {
        let digits = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digits)
    }
}


struct Day01: AdventDay {
    var data: String;
    
    var entities: [String] {
        data.components(separatedBy: .newlines)
    }
    
    let digitsInWords: [String] = [
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
    ]
    
    func wordToDigit(wordDigit: String)->Int? {
        switch(wordDigit) {
        case digitsInWords[0]:
            return 1;
        case digitsInWords[1]:
            return 2;
        case digitsInWords[2]:
            return 3;
        case digitsInWords[3]:
            return 4;
        case digitsInWords[4]:
            return 5;
        case digitsInWords[5]:
            return 6;
        case digitsInWords[6]:
            return 7;
        case digitsInWords[7]:
            return 8;
        case digitsInWords[8]:
            return 9;
        default:
            break;
        }
        return nil;
    }
    
    
    func part1() async throws -> Int {
        //Only have the second part
        return 0;
    }
    
    func part2() async throws -> Int {
        var result = 0;
        for word in entities {
            var charArray: [Character] = [];
            var numberArray: [Int] = [];
            var doubleDigit: Int = 0;
            
            for char in word {
                charArray.append(char);
                if (char.isNumber) {
                    numberArray.append(Int(String(char)) ?? 0)
                    continue;
                }
                
                let wordDigit: String = String(charArray);
                
                
                for item in digitsInWords {
                    
                    if wordDigit.contains(item) {
                        if let number = wordToDigit(wordDigit: item) {
                            numberArray.append(number)
                        }
                        charArray = [];
                        charArray.append(char);
                        break;
                    }
                }
            }
            if let firstElement = numberArray.first {
                doubleDigit = firstElement * 10;
            }
            
            if let lastElement = numberArray.last {
                doubleDigit += lastElement;
            }
            result += doubleDigit;
            
        }
        return result;
    }
    
    
}
