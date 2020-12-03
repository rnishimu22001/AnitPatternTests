//
//  MockAsynchronousTestTargetOutput.swift
//  AnitPatternTestsTests
//
//  Created by rnishimu on 2020/11/29.
//

@testable import AnitPatternTests

final class MockAsynchronousTestTargetOutput: AsynchronousTestTargetOutput {
    func loadFromSomeWhere(completion: (() -> Void)) {
        completion()
    }
}
