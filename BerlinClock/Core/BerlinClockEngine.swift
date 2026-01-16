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
    
    func getSingleHoursLamps(hours: Int) -> [LampState] {
        let modulo = hours % 5
        return (0..<4).map { $0 < modulo ? .red : .off }
    }
    
    func getFiveMinutesLamps(minutes: Int) -> [LampState] {
        return (0..<11).map { _ in .red }
    }
    
    func getSingleMinutesLamps(minutes: Int) -> [LampState] {
        let modulo = minutes % 5
        return (0..<4).map { $0 < modulo ? .yellow : .off }
    }
}
