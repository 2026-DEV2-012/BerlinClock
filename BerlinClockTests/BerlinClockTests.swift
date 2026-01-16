//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Julien Henrard on 12/01/2026.
//

import Testing
@testable import BerlinClock

struct BerlinClockTests {

    private let clock = BerlinClockEngine()
    
    // Seconds lamp
    @Test func testSecondsLampReturnYellowIfEven() {
        #expect(clock.getSecondsLamp(seconds: 30) == .yellow)
    }
    
    @Test func testSecondsLampReturnOffIfOdd() {
        #expect(clock.getSecondsLamp(seconds: 31) == .off)
    }
    
    // Five hours lamps
    @Test func testFiveHoursLampsReturnAllOffWhenLessThan5() {
        #expect(clock.getFiveHoursLamps(hours: 4) == [.off, .off, .off, .off])
    }
    
    @Test func testFiveHoursLampsReturn1RedWhenBetween5And9() {
        #expect(clock.getFiveHoursLamps(hours: 8) == [.red, .off, .off, .off])
    }
    
    @Test func testFiveHoursLampsReturn2RedWhenBetween10And14() {
        #expect(clock.getFiveHoursLamps(hours: 11) == [.red, .red, .off, .off])
    }
    
    @Test func testFiveHoursLampsReturn3RedWhenBetween15And19() {
        #expect(clock.getFiveHoursLamps(hours: 15) == [.red, .red, .red, .off])
    }
    
    @Test func testFiveHoursLampsReturn4RedWhenBetween20And23() {
        #expect(clock.getFiveHoursLamps(hours: 23) == [.red, .red, .red, .red])
    }
    
    // Single hours lamps
    @Test func testSingleHoursLampsReturnAllOffWhenMultipleOf5() {
        #expect(clock.getSingleHoursLamps(hours: 0) == [.off, .off, .off, .off])
        #expect(clock.getSingleHoursLamps(hours: 5) == [.off, .off, .off, .off])
        #expect(clock.getSingleHoursLamps(hours: 10) == [.off, .off, .off, .off])
    }
    
    @Test func testSingleHoursLampsReturnModulo5AsRedLamps() {
        #expect(clock.getSingleHoursLamps(hours: 1) == [.red, .off, .off, .off])
        #expect(clock.getSingleHoursLamps(hours: 7) == [.red, .red, .off, .off])
        #expect(clock.getSingleHoursLamps(hours: 13) == [.red, .red, .red, .off])
        #expect(clock.getSingleHoursLamps(hours: 19) == [.red, .red, .red, .red])
    }
}
