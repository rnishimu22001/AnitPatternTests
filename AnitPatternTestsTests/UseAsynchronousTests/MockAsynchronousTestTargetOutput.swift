//
//  MockAsynchronousTestTargetOutput.swift
//  AnitPatternTestsTests
//
//  Created by rnishimu on 2020/11/29.
//

import Foundation
@testable import AnitPatternTests

final class MockAsynchronousTestTargetOutputAntiPattern: AsynchronousTestTargetOutput {
    var invokedLoadFromSomeWhereCompletion: (() -> Void)?
    func loadFromSomeWhere(completion: @escaping (() -> Void)) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            completion()
            self?.invokedLoadFromSomeWhereCompletion?()
        }
    }
}

final class MockAsynchronousTestTargetOutputGoodPattern: AsynchronousTestTargetOutput {
    var invokedLoadFromSomeWhereCount = 0
    var invokedLoadFromSomeWhereCompletionParameter: (() -> Void)?
    func loadFromSomeWhere(completion: @escaping (() -> Void)) {
        invokedLoadFromSomeWhereCount += 1
        invokedLoadFromSomeWhereCompletionParameter = completion
    }
}
