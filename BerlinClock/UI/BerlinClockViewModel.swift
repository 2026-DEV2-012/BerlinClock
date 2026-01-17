//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by Julien Henrard on 17/01/2026.
//

import Foundation

class BerlinClockViewModel {
    private let clock: BerlinClockEngine
    
    init(clock: BerlinClockEngine = BerlinClockEngine()) {
        self.clock = clock
    }
    
    func getBerlinClock(forDate date: Date) -> BerlinClockResult {
        return self.clock.convert(date: date)
    }
}
