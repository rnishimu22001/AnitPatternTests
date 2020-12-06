//
//  TargetViewController.swift
//  AnitPatternTests
//
//  Created by Funny on 2020/12/06.
//

import UIKit

protocol TargetViewControllerOutput {
    /// ViewControllerで表示された時に一度だけ呼び出したい処理
    func wantToInvokeOnlyOnce()
}

final class TargetViewController: UIViewController {
    
    let output: TargetViewControllerOutput
    private var isDidAppear = false
    
    init(output: TargetViewControllerOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isDidAppear {
            output.wantToInvokeOnlyOnce()
        }
        isDidAppear = true
    }
}
