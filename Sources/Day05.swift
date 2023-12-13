//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 13.12.23.
//

import Foundation

struct Day05: AdventDay {
    let data: String;
    
     var seedArr: [Int]  {
         return data.split(separator: "\n\n")[0].split(separator: " ").compactMap{ Int($0) };
         
     }
    
    var maps: [String] {
        var all = data.split(separator: "\n\n").compactMap{ String($0)}
        
        all.removeFirst();
        
        return all;
    }
    
    func part1() throws -> Int {
        var seeds = seedArr;
        
        for block in maps {
            var ranges: [[Int]] = [];
            var blocks = block.components(separatedBy: .newlines);
            blocks.removeFirst();
            for line in blocks {
                let arr  = line.split(separator: " ").compactMap{ Int($0) };
                ranges.append(arr);
            }
            
            var new: [Int] = [];
            
            for x in seeds {
                var found = true;
                for item in ranges {
                    let a = item[0], b = item[1], c = item[2];
                    
                    if (b...b+c).contains(x) {
                        new.append(x - b + a);
                        found = false;
                        break;
                    }
                }
                if(found) {
                    new.append(x);
                }
            }
            seeds = new;
            
        }
        return seeds.min() ?? 0;
    }
    
    func part2()  throws -> Int {
        let input = seedArr;
        
        var seedPairs: [(Int, Int)] = [];
        
        for i in stride(from: 0, to: input.count - 1, by: 2) {
            seedPairs.append((input[i], input[i] + input[i + 1]))
        }
        
        
//        print(seedPairs);
        
        for block in maps {
            var ranges: [[Int]] = [];
            
            
            var blocks = block.components(separatedBy: .newlines);
            
            
            blocks.removeFirst();
            for line in blocks {
                let arr  = line.split(separator: " ").compactMap{ Int($0) };
                ranges.append(arr);
            }
            
            var new: [(Int, Int)] = [];
            
            while(seedPairs.count > 0) {
                
                let (start, end) = seedPairs.removeLast();
                
                var found = true;
                
                for item in ranges {
                    let a = item[0], b = item[1], c = item[2];
                    //check overlap
                    let overlapStart = max(start,b);
                    let overlapEnd = min(end, b + c);
                    
                    
                    if (overlapStart < overlapEnd) {
                        new.append((overlapStart - b + a, overlapEnd -  b + a));
                        
                        if (overlapStart > start) {
                            seedPairs.append((start, overlapStart))
                        }
                        if (end > overlapEnd) {
                            seedPairs.append((overlapEnd, end))
                        }
                        found = false;
                        
                        break;
                    }
                }
                if (found) {
                    new.append((start, end))
                }
            }
            
            seedPairs = new;
        }
        
        print(seedPairs.sorted(by: { x, y in x.0 < y.0 }));
        
        let minValue = seedPairs.min(by: { $0.0 < $1.0  });
        
        return minValue?.0 ?? 0
    }
}
