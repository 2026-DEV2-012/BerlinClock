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
    
    //MARK: Seconds lamp
    @Test func testSecondsLampReturnYellowIfEven() {
        #expect(clock.getSecondsLamp(seconds: 30) == .yellow)
    }
    
    @Test func testSecondsLampReturnOffIfOdd() {
        #expect(clock.getSecondsLamp(seconds: 31) == .off)
    }
    
    //MARK: Five hours lamps
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
    
    //MARK: Single hours lamps
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
    
    //MARK: Single minutes lamps
    @Test func testSingleMinutesLampsReturnAllOffWHenMultipleOf5() {
        #expect(clock.getSingleMinutesLamps(minutes: 0) == [.off, .off, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 5) == [.off, .off, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 15) == [.off, .off, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 30) == [.off, .off, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 55) == [.off, .off, .off, .off])
    }
    
    @Test func testSingleMinutesLampsReturnModulo5AsYellowLamps() {
        #expect(clock.getSingleMinutesLamps(minutes: 6) == [.yellow, .off, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 12) == [.yellow, .yellow, .off, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 33) == [.yellow, .yellow, .yellow, .off])
        #expect(clock.getSingleMinutesLamps(minutes: 59) == [.yellow, .yellow, .yellow, .yellow])
    }
}
