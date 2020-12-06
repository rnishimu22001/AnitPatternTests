//
//  ViewControllerTests.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

import XCTest
@testable import AnitPatternTests

final class ViewControllerLifecycleTests: XCTestCase {
    func testLifecycle() {
        let target = TargetViewController()
        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.rootViewController = target
            
        }
    }
}
