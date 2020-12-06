//
//  MockTargetViewControllerOutput.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

@testable import AnitPatternTests

final class MockTargetViewControllerOutput: TargetViewControllerOutput {
    var invokedSetupCount = 0
    func setup() {
        invokedSetupCount += 1
    }
    
    var invokedWantToInvokeAfterSetupCount = 0
    func wantToInvokeAfterSetup() {
        invokedWantToInvokeAfterSetupCount += 1
    }
}
