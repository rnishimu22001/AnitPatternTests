//
//  SleeperTests.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

@testable import AnitPatternTests
import XCTest

final class SleeperTests: XCTestCase {
    func testAddNotification() {
        let notificationCenter =  MockNotificationCenterFacade()
        let target = SleeperTestTarget(notificationCenter: notificationCenter)
        target.addNotification()
        if let trigger = notificationCenter.invokedAddRequestParameter?.trigger as? UNTimeIntervalNotificationTrigger {
            let components = trigger.timeInterval
            XCTAssertEqual(components, 7 * 24 * 60 * 60)
        } else {
            XCTFail()
        }
    }
}
