//
//  AsynchronousTestTarget.swift
//  AnitPatternTests
//
//  Created by rnishimu on 2020/11/29.
//

protocol AsynchronousTestTargetOutput {
    func loadFromSomeWhere(completion: (() -> Void))
}

final class AsynchronousTestTarget {
    enum Status {
        case initialized
        case loading
        case didLoad
    }
    
    private(set) var status: Status = .initialized
    private let output: AsynchronousTestTargetOutput
    
    init(output: AsynchronousTestTargetOutput) {
        self.output = output
    }
    
    func load(completion: @escaping (() -> Void)) {
        status = .loading
        output.loadFromSomeWhere {
            status = .didLoad
            completion()
        }
    }
}
