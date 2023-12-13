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
        return 0;
    }
}
