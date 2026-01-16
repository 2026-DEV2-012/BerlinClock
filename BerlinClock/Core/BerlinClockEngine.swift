//
//  BerlinClock.swift
//  BerlinClock
//
//  Created by Julien Henrard on 16/01/2026.
//

struct BerlinClockEngine {
    init() {}
    
    func getSecondsLamp(seconds: Int) -> LampState {
        return seconds.isMultiple(of: 2) ? .yellow : .off
    }
    
    func getFiveHoursLamps(hours: Int) -> [LampState] {
        let redLampsCount: Int = hours / 5
        return (0..<4).map { $0 < redLampsCount ? .red : .off }
    }
}
