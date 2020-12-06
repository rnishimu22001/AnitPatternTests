//
//  ViewControllerTests.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

import XCTest
@testable import AnitPatternTests

final class ViewControllerLifecycleTests: XCTestCase {
    /// ダメなパターン
    func testLifecycleAntiPattern() {
        // Given
        let output = MockTargetViewControllerOutput()
        let target = TargetViewController(output: output)
        let expectation = self.expectation(description: "dispatch queueが実行されること")
        DispatchQueue.main.async {
            // When
            UIApplication.shared.windows.first?.rootViewController?.present(target, animated: false) {
                // Then
                expectation.fulfill()
                XCTAssertEqual(output.invokedSetupCount, 1)
                XCTAssertEqual(output.invokedWantToInvokeAfterSetupCount, 1)
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    /// よさそうだと思ったパターン
    func testLifecycleGoodPattern() {
    
        // Given
        let output = MockTargetViewControllerOutput()
        let target = TargetViewController(output: output)
        // When
        target.viewDidLoad()
        // Then
        XCTAssertEqual(output.invokedSetupCount, 1)
        XCTAssertEqual(output.invokedWantToInvokeAfterSetupCount, 0, "viewDidLoadでは呼び出されない")
        // When
        target.viewDidAppear(false)
        // Then
        XCTAssertEqual(output.invokedSetupCount, 1, "viewDidAppearでは呼び出されない")
        XCTAssertEqual(output.invokedWantToInvokeAfterSetupCount, 1)
    }
}
