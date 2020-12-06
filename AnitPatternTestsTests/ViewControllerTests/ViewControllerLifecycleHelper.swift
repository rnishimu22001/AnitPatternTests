//
//  ViewControllerLifecycleHelper.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

import UIKit

final class ViewControllerLifecycleHelper {
    func emulatePushCycle(viewController: UIViewController) {
        viewController.loadView()
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)
        // 残りのライフサイクル...
    }
}
