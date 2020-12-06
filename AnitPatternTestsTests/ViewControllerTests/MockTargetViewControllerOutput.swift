//
//  MockTargetViewControllerOutput.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

@testable import AnitPatternTests

final class MockTargetViewControllerOutput: TargetViewControllerOutput {
    
    var invokedWantToInvokeOnlyOnceCount = 0
    func wantToInvokeOnlyOnce() {
        invokedWantToInvokeOnlyOnceCount += 1
    }
}
