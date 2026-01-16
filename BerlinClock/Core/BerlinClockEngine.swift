//
//  BerlinClock.swift
//  BerlinClock
//
//  Created by Julien Henrard on 16/01/2026.
//

import Foundation

struct BerlinClockEngine {
    init() { }

    func convert(date: Date) -> BerlinClockResult {
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        return convert(
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0,
            seconds: components.second ?? 0
        )
    }

    func convert(hours: Int, minutes: Int, seconds: Int) -> BerlinClockResult {
        return .init(
            seconds: getSecondsLamp(seconds: seconds),
            fiveHoursRow: getFiveHoursLamps(hours: hours),
            singleHoursRow: getSingleHoursLamps(hours: hours),
            fiveMinutesRow: getFiveMinutesLamps(minutes: minutes),
            singleMinutesRow: getSingleMinutesLamps(minutes: minutes))
    }

    func getSecondsLamp(seconds: Int) -> LampState {
        return seconds.isMultiple(of: 2) ? .yellow : .off
    }

    func getFiveHoursLamps(hours: Int) -> [LampState] {
        let redLampsCount: Int = hours / 5
        return (0..<4).map { $0 < redLampsCount ? .red : .off }
    }

    func getSingleHoursLamps(hours: Int) -> [LampState] {
        let modulo = hours % 5
        return (0..<4).map { $0 < modulo ? .red : .off }
    }

    func getFiveMinutesLamps(minutes: Int) -> [LampState] {
        let litLampsCount: Int = minutes / 5
        let redPositions = [2, 5, 8]

        return (0..<11).map { value in
            guard value < litLampsCount else { return .off }
            return redPositions.contains(value) ? .red : .yellow
        }
    }

    func getSingleMinutesLamps(minutes: Int) -> [LampState] {
        let modulo = minutes % 5
        return (0..<4).map { $0 < modulo ? .yellow : .off }
    }
}
