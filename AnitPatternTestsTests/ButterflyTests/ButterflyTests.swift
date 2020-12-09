//
//  ButterflyTests.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/08.
//

import XCTest
@testable import AnitPatternTests

final class ButterflyTests: XCTestCase {
func testTenMinutesLater() {
    // Given
    let target = ButterflyTestTarget()
    let now = Date()
    // When
    let result = target.tenMinutesLater(from: now)
    // Then
    let tenMinutesLater = now.timeIntervalSince1970 + 10 * 60
    XCTAssertEqual(tenMinutesLater, result)
    
}
}
