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
        let otherViewController = UIViewController()
        let expectation = self.expectation(description: "dispatch queueが実行されること")
        DispatchQueue.main.async {
            // When
            UIApplication.shared.windows.first?.rootViewController?.present(target, animated: false) {
                // Then
                XCTAssertEqual(output.invokedWantToInvokeOnlyOnceCount, 1, "表示されて最初の一回は呼び出されること")
                target.present(otherViewController, animated: false) {
                    otherViewController.dismiss(animated: false, completion: {
                        // Then
                        expectation.fulfill()
                        XCTAssertEqual(output.invokedWantToInvokeOnlyOnceCount, 1, "別画面からの戻りでは呼び出されないこと")
                    })
                }
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    /// よさそうだと思ったパターン
    func testLifecycleGoodPattern() {
        XCTContext.runActivity(named: "viewDidAppearが呼ばれた場合") { _ in
            // Given
            let output = MockTargetViewControllerOutput()
            let target = TargetViewController(output: output)
            // When
            // When
            target.viewDidAppear(false)
            // Then
            XCTAssertEqual(output.invokedWantToInvokeOnlyOnceCount, 1)
        }
        XCTContext.runActivity(named: "2回目のviewDidAppearが呼ばれた場合") { _ in
            // Given
            let output = MockTargetViewControllerOutput()
            let target = TargetViewController(output: output)
            // When
            // When
            target.viewDidAppear(false)
            target.viewDidAppear(false)
            // Then
            XCTAssertEqual(output.invokedWantToInvokeOnlyOnceCount, 1, "2回呼び出しても1回しか呼び出されないこと")
        }
    }
}
