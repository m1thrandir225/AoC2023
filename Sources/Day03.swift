//
//  File 2.swift
//  
//
//  Created by Sebastijan Zindl on 12.12.23.
//

import Foundation


struct Day03: AdventDay {
    
    var data: String;
    
    var entities: [String] {
        data.components(separatedBy: .newlines)
    }
    
    //ABSOLUTELY DOGSHIT SOLUTION :D
    func part1() throws -> Int {
        
        var cs = Set<[Int]>();
        var ns: [Int] = [];
        
        for (r, row) in entities.enumerated() {
            for (c, ch) in row.enumerated() {
                if(ch.isNumber || ch == ".") {
                    continue;
                }
                
                for cr in [r-1, r, r+1] {
                    for var cc in [ c - 1, c, c + 1] {
                        if (cr < 0 || cr >= entities.count || cc < 0 || cc >= entities[cr].count ||  !Array(entities[cr])[cc].isNumber) {
                            continue;
                        }
                        while (cc > 0 && Array(entities[cr])[cc-1].isNumber) {
                            cc-=1;
                        }
                        cs.insert([cr, cc]);
                    }
                }
            }
            
        }
        
        for item in cs  {
            let r = item[0];
            var c = item[1];
            var s = "";
            
            while (c < entities[r].count && Array(entities[r])[c].isNumber) {
                s += String(Array(entities[r])[c]);
                c += 1;
            }
            ns.append(Int(s) ?? 0);
        }
        
        return ns.reduce(0, +);
    }
    
    //ANOTHER ABSOLUTE DOGSHIT SOLUTION :DDDDDDDDDDDDDDDDD
    
    func part2()  throws -> Int {
        
        var total: Int = 0;
        for (r, row) in entities.enumerated() {
            for (c, ch) in row.enumerated() {
                
                if(ch != "*") {
                    continue;
                }
                var cs = Set<[Int]>();
                
                
                for cr in [r-1, r, r+1] {
                    for var cc in [ c - 1, c, c + 1] {
                        if (cr < 0 || cr >= entities.count || cc < 0 || cc >= entities[cr].count ||  !Array(entities[cr])[cc].isNumber) {
                            continue;
                        }
                        while (cc > 0 && Array(entities[cr])[cc-1].isNumber) {
                            cc-=1;
                        }
                        cs.insert([cr, cc]);
                    }
                }
                
                if (cs.count != 2) {
                    continue;
                }
                
                var ns: [Int] = [];
                
                for item in cs  {
                    let rr = item[0];
                    var cc = item[1];
                    var s = "";
                    
                    while (cc < entities[rr].count && Array(entities[rr])[cc].isNumber) {
                        s += String(Array(entities[rr])[cc]);
                        cc += 1;
                    }
                    ns.append(Int(s) ?? 0);
                }
                total += ns[0] * ns[1]
            }
            
        }
        return total;
    }
}
