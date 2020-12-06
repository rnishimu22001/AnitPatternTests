//
//  MockAsynchronousTestTargetOutput.swift
//  AnitPatternTestsTests
//
//  Created by rnishimu on 2020/11/29.
//

import Foundation
@testable import AnitPatternTests

final class MockAsynchronousTestTargetOutput: AsynchronousTestTargetOutput {
    var invokedLoadFromSomeWhereCompletion: (() -> Void)?
    func loadFromSomeWhere(completion: @escaping (() -> Void)) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            completion()
            self?.invokedLoadFromSomeWhereCompletion?()
        }
    }
}
