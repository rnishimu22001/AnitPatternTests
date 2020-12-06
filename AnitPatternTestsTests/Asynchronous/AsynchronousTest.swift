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
        let expectation = self.expectation(description: "loadFromSomeWhereが呼び出されること")
        let mock = MockAsynchronousTestTargetOutput()
        let target = AsynchronousTestTarget(output: mock)
        mock.invokedLoadFromSomeWhereCompletion = {
            // Then
            expectation.fulfill()
        }
        // When
        target.load()
        // Then
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(target.status, .didLoad, "ステータスがロード完了になること")
    }
}
