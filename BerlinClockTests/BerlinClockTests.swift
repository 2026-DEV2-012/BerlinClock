//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Julien Henrard on 12/01/2026.
//

import Testing
@testable import BerlinClock

struct BerlinClockTests {

    // Seconds lamp
    @Test func testSecondsLampReturnYellowIfEven() {
        let clock = BerlinClockEngine()
        #expect(clock.getSecondsLamp(seconds: 30) == .yellow)
    }
    
    @Test func testSecondsLampReturnOffIfOdd() {
        let clock = BerlinClockEngine()
        #expect(clock.getSecondsLamp(seconds: 31) == .off)
    }
}
