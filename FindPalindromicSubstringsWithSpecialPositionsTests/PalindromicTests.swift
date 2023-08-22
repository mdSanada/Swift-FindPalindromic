//
//  PalindromicTests.swift
//  FindPalindromicSubstringsWithSpecialPositionsTests
//
//  Created by Matheus Sanada on 22/08/23.
//

import XCTest
@testable import FindPalindromicSubstringsWithSpecialPositions

final class PalindromicTests: XCTestCase {
    let palindromic = Palindromic()

    func testPalindromic_BANANAS_Output5() {
        let name = "BANANAS"
        let position = [0]
        let output = 5
        
        self.measure {
            let value = palindromic.find(name,
                                         special: position)
            
            XCTAssertEqual(value, output)
        }
    }
    
    func testPalindromic_BANANAS_Output1() {
        let name = "BANANAS"
        let position = [1, 7]
        let output = 1
        
        self.measure {
            let value = palindromic.find(name,
                                         special: position)
            
            XCTAssertEqual(value, output)
        }
    }
    
    func testPalindromic_ACDAAACX_Output3() {
        let name = "ACDAAACX"
        let position = [3, 2, 3, 8]
        let output = 3
        
        self.measure {
            let value = palindromic.find(name,
                                         special: position)
            
            XCTAssertEqual(value, output)
        }
    }
    
    func testPalindromic_ACDAAACX_Output5() {
        let name = "ACDAAACX"
        let position = [3, 2, 3, 8, 2, 4]
        let output = 5
        
        self.measure {
            let value = palindromic.find(name,
                                         special: position)
            
            XCTAssertEqual(value, output)
        }
    }
    
    func testPalindromic_MARATONA_Output3() {
        let name = "MARATONA"
        let position = [4, 3, 1, 5, 2]
        let output = 3
        
        self.measure {
            let value = palindromic.find(name,
                                         special: position)
            
            XCTAssertEqual(value, output)
        }
    }
    
    func testPalindromic_BRUTE_FORCE_1K() {
        let name = "ABCD" + String(repeating: "E", count: 996) + "F"
        let position = [10, 50, 100, 500, 999]
        let output = 996
        
        self.measure {
            let result = palindromic.find(name,
                                          special: position)
            XCTAssertEqual(result, output)
        }
    }
    
    func testPalindromic_BRUTE_FORCE_2K() {
        let name = "ABCD" + String(repeating: "E", count: 1996) + "F"
        let position = [100, 500, 1000, 1500, 1999]
        let output = 1996
        
        self.measure {
            let result = palindromic.find(name,
                                          special: position)
            XCTAssertEqual(result, output)
        }
    }
    
}
