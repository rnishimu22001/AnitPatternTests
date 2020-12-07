//
//  SleeperTestTarget.swift
//  AnitPatternTests
//
//  Created by Funny on 2020/12/06.
//

import UserNotifications
import Foundation

struct SleeperTestTarget {
    
    let calendar = Calendar(identifier: .gregorian)
    let notificationCenter: UNNotificationCenterFacadeProtocol
    
    func addNotification() {
        let now = Date()
        var component = calendar.dateComponents(in: .current, from: now)
        component.day! += 7
        let content = UNMutableNotificationContent()
        content.title = "test"
        let firedDate = component.date!
        let oneWeekInterval = firedDate.timeIntervalSince1970 - now.timeIntervalSince1970
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: oneWeekInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "local notification", content: content, trigger: trigger)
        notificationCenter.add(request: request)
    }
}

protocol UNNotificationCenterFacadeProtocol {
    func add(request: UNNotificationRequest)
}

struct UNNotificationCenterFacade: UNNotificationCenterFacadeProtocol {
    func add(request: UNNotificationRequest) {
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
