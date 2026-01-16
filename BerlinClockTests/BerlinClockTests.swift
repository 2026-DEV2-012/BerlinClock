//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Julien Henrard on 12/01/2026.
//

import Testing
@testable import BerlinClock

struct BerlinClockTests {

    @Test func testSecondsLampReturnYellowIfEven() {
        let clock = BerlinClockEngine()
        #expect(clock.getLampFor(second: 30) == .yellow)
    }
    
    @Test func testSecondsLampReturnOffIfOdd() {
        let clock = BerlinClockEngine()
        #expect(clock.getLampFor(second: 31) == .off)
    }
}
