//
//  AsynchronousTests.swift
//  AnitPatternTestsTests
//
//  Created by rnishimu on 2020/11/29.
//

@testable import AnitPatternTests
import XCTest

final class AsynchronousTests: XCTestCase {
    /// 良くなさそうと思ったパターン
    func testLoadAntiPattern() {
        // Given
        let expectation = self.expectation(description: "loadFromSomeWhereが呼び出されること")
        let mock = MockAsynchronousTestTargetOutputAntiPattern()
        let target = AsynchronousTestTarget(output: mock)
        mock.invokedLoadFromSomeWhereCompletion = {
            // Then
            expectation.fulfill()
        }
        // When
        target.load()
        // Then
        XCTAssertEqual(target.status, .loading, "ロード直後は読み込み中になること")
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(target.status, .didLoad, "ステータスがロード完了になること")
    }
    
    /// 良さそうだと思ったパターン
    func testLoadGoodPattern() {
        // Given
        let mock = MockAsynchronousTestTargetOutputGoodPattern()
        let target = AsynchronousTestTarget(output: mock)
        // When
        target.load()
        // Then
        XCTAssertEqual(target.status, .loading, "ロード直後は読み込み中になること")
        XCTAssertEqual(mock.invokedLoadFromSomeWhereCount, 1, "ロード時にloadFromSomeWhereが1回呼び出されること")
        mock.invokedLoadFromSomeWhereCompletionParameter?()
        XCTAssertEqual(target.status, .didLoad, "ステータスがロード完了になること")
    }
}
