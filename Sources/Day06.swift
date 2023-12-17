//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 13.12.23.
//

import Foundation

struct Day06: AdventDay {
    let data: String;
    
    var entities: [(Int, Int)] {
        let arr = data.components(separatedBy: .newlines).compactMap { item in
            item.split(separator: ":").compactMap { row in
                row.split(separator: " ").compactMap( { number in
                        Int(number)
                } )
            }
        }
        let timeArr = arr[0][1];
        let distanceArr = arr[1][1];
        
        var finalArr: [(Int, Int)] = [];
        
        for i in 0..<timeArr.count {
            finalArr.append((timeArr[i], distanceArr[i]));
        }
        return finalArr;
    }


    func part1() throws -> Int {
        var product = 1;
        for item in entities {
            let distanceToBeat = item.1;
            let time = item.0;
            var possibleTimes: Set<Int> = [];
        
            for i in 1...time {
                let calculatedDistance = (time - i) * i;
                
                if(calculatedDistance > distanceToBeat) {
                    possibleTimes.insert(i);
                }
            }
            
            product *= possibleTimes.count;
        }
        return product;
    }
    
    
    func part2() throws -> Int {
        var timeArr: [Int] = [];
        var distanceArr: [Int]  = [];
        
        for item in entities {
            timeArr.append(item.0);
            distanceArr.append(item.1);
        }
        
        let time = Int(timeArr.map(String.init).joined()) ?? 0;
        let distanceToBeat = Int(distanceArr.map(String.init).joined()) ?? 0;
        
        var allPossibleWays: Set<Int> = [];
        
        for i in 1...time {
            let calculatedDistance = (time - i) * i;
            
            if(calculatedDistance > distanceToBeat) {
                allPossibleWays.insert(i);
            }
        }
        
        return allPossibleWays.count;
    }
    
}
