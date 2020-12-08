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
        // When
        let result = target.tenMinutesLater()
        // Then
        let tenMinutesLater = Date().timeIntervalSince1970 + 10 * 60
        XCTAssertGreaterThanOrEqual(result, tenMinutesLater - 1, "テストコードとテスト対象")
        XCTAssertGreaterThanOrEqual(tenMinutesLater + 1, result)
    }
}
