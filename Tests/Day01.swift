//
//  File.swift
//  
//
//  Created by Sebastijan Zindl on 13.12.23.
//

import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    let testData = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """
    
    func testPart2() throws {
        let challenge = Day01(data: testData);
        XCTAssertEqual(try? challenge.part2(), 281)
    }
}
