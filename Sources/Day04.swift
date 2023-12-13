//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 12.12.23.
//

import Foundation

struct ScratchCard {
    let id: Int;
    let matches: Int;
    
    init(_ string: String) {
        // Card 1: 00 000 000 | 0000 000 000
        let cardParts = string.components(separatedBy: ":");
        
        
        let id = Int(cardParts[0].split(separator: " ")[1]);

        self.id = id!;
        
        let cardNumbers = cardParts[1].components(separatedBy: "|");
        let winners = Set(cardNumbers[0].split(separator: " ").compactMap{ Int(String($0)) })
        
        let elfNumbers = Set(cardNumbers[1].split(separator: " ").compactMap{ Int(String($0)) })
        
        self.matches = elfNumbers.intersection(winners).count;
        
    }
    
    var cardPoints: Int {
        1 << (matches - 1)
    }
}

struct Day04: AdventDay {
    var data: String;
    
    var entities: [ScratchCard] {
       let lines =  data.components(separatedBy: .newlines)
        return lines.map { ScratchCard($0)}
    }
    
    func part1() async throws -> Int {
        
        var sum = 0;
        
        for game in entities {
            sum += game.cardPoints;
        }
        return sum;
    }
    
    

    func part2() async throws -> Int {
        var copies = [Int](repeating: 1, count: entities.count + 1)
        print(copies);
        copies[0] = 0;
        
        for card in entities where card.matches > 0 {
            for i in card.id + 1 ... card.id + card.matches {
                copies[i] += copies[card.id]
            }
        }
        
        print(copies);
        
        return copies.reduce(0, +)
        
    }
}
