//
//  AsynchronousTest.swift
//  AnitPatternTestsTests
//
//  Created by rnishimu on 2020/11/29.
//

@testable import AnitPatternTests
import XCTest

final class AsynchronousTest: XCTestCase {
    func testLoad() {
        // Given
        let expectation = self.expectation(description: "loadの完了が通知されること")
        let mock = MockAsynchronousTestTargetOutput()
        let target = AsynchronousTestTarget(output: mock)
        // When
        target.load {
            // Then
            expectation.fulfill()
            XCTAssertEqual(target.status, .didLoad, "ステータスがロード完了になること")
        }
        wait(for: [expectation], timeout: 1)
    }
}
