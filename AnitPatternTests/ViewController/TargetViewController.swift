//
//  TargetViewController.swift
//  AnitPatternTests
//
//  Created by Funny on 2020/12/06.
//

import UIKit

protocol TargetViewControllerOutput {
    /// オブジェクトを使う前の前処理
    func setup()
    /// setup後に呼び出したい処理
    func wantToInvokeAfterSetup()
}

final class TargetViewController: UIViewController {
    
    let output: TargetViewControllerOutput
    
    init(output: TargetViewControllerOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.wantToInvokeAfterSetup()
    }
}
