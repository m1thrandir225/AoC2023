//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 13.12.23.
//

import XCTest

@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    let testData = """
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """
    
    func testPart1() throws {
        let challenge = Day03(data: testData);
        XCTAssertEqual(try challenge.part1(), 4361)
    }
    
    func testPart2() throws {
        let challenge = Day03(data: testData);
        XCTAssertEqual(try challenge.part2(), 467835)
    }
}
