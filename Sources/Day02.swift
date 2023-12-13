//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 12.12.23.
//

import Foundation

struct Ball {
    var color: String;
    var value: Int;
}

struct Day02: AdventDay {
    var data: String;
    
    var entities: [String] {
        data.components(separatedBy: .newlines)
    }
    
    let balls: [String : Int] = [
        "red": 12,
        "green": 13,
        "blue": 14,
    ]
    
    func part1() throws -> Int {
        var sum = 0;
        
        for game in entities {
            let gameId = Int(game.split(separator: ": ")[0].split(separator: " ")[1]);
            let gameDraws = game.split(separator: ": ")[1].split(separator: "; ");
            var valid = true;
            
            
            for roundDraw in gameDraws {
                //Format 3 blue, 4 red;
                let draws = roundDraw.split(separator: ", ");
                
                for singleDraw in draws {
                    //Format: 3 blue
                    let number = Int(singleDraw.split(separator: " ")[0])
                    let color = singleDraw.split(separator: " ")[1]
                    
                    if let validRule = balls[String(color)] {
                        if let validNumberFromDraw = number {
                            if validNumberFromDraw > validRule {
                                valid = false;
                            }
                        }
                    }
                    
                }
            }
            
            if (valid) {
                sum += gameId ?? 0;
            }
        }
        
        return sum;
    }
    
    func part2() throws -> Int {
        var sum = 0;
        
        for game in entities {
            let gameDraws = game.split(separator: ": ")[1].split(separator: "; ");
            var minBlue = 0;
            var minRed = 0;
            var minGreen = 0;
            for roundDraw in gameDraws {
                //Format 3 blue, 4 red;
                let draws = roundDraw.split(separator: ", ");
                
                for singleDraw in draws {
                    //Format: 3 blue
                    
                    let number = Int(singleDraw.split(separator: " ")[0])
                    let color = singleDraw.split(separator: " ")[1]
                    
                    if let validNumber = number {
                        if (color ==  "red") {
                            if(validNumber > minRed) {
                                minRed = validNumber;
                            }
                        }
                        if (color == "green") {
                            if(validNumber > minGreen) {
                                minGreen = validNumber;
                            }
                        }
                        if(color == "blue") {
                            if (validNumber > minBlue) {
                                minBlue = validNumber;
                            }
                        }
                            
                    }
                }
            }
            
            sum += minRed * minBlue * minGreen;
        }
        return sum;
    }
}
