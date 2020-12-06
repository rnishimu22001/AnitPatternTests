//
//  AsynchronousTestTarget.swift
//  AnitPatternTests
//
//  Created by rnishimu on 2020/11/29.
//

protocol AsynchronousTestTargetOutput {
    func loadFromSomeWhere(completion: @escaping (() -> Void))
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
    
    func load() {
        status = .loading
        output.loadFromSomeWhere { [weak self] in
            self?.status = .didLoad
        }
    }
}
