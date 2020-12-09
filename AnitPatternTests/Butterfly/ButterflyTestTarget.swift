//
//  ButterflyTestTarget.swift
//  AnitPatternTests
//
//  Created by Funny on 2020/12/08.
//

import Foundation

struct ButterflyTestTarget {
/// 十分後のTimeInterval形式で返す
func tenMinutesLater(from referenceDate: Date = Date()) -> TimeInterval {
    let tenMinutes: TimeInterval = 10 * 60
    return referenceDate.timeIntervalSince1970 + tenMinutes
}
}
