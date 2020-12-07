//
//  MockNotificationCenterFacade.swift
//  AnitPatternTestsTests
//
//  Created by Funny on 2020/12/06.
//

import UserNotifications
@testable import AnitPatternTests

final class MockNotificationCenterFacade: UNNotificationCenterFacadeProtocol {
    var invokedAddRequestParameter: UNNotificationRequest?
    func add(request: UNNotificationRequest) {
        invokedAddRequestParameter = request
    }
}
