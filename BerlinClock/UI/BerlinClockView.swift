//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by Julien Henrard on 17/01/2026.
//

import SwiftUI

struct BerlinClockView: View {

    private let viewModel: BerlinClockViewModel

    init(viewModel: BerlinClockViewModel = BerlinClockViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            let berlinClock = viewModel.getBerlinClock(forDate: context.date)
            VStack(spacing: 24) {
                Text("Berlin Clock")
                    .font(.largeTitle.bold())
                    .padding(.top, 48)
                Spacer()
                LampView(state: berlinClock.seconds, shape: .round)
                    .frame(maxWidth: 80)
                
                HStack {
                    ForEach(berlinClock.fiveHoursRow.indices, id: \.self) { i in
                        LampView(state: berlinClock.fiveHoursRow[i], shape: .rectangle)
                    }
                }
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(berlinClock.singleHoursRow.indices, id: \.self) { i in
                        LampView(state: berlinClock.singleHoursRow[i], shape: .rectangle)
                    }
                }
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(berlinClock.fiveMinutesRow.indices, id: \.self) { i in
                        LampView(state: berlinClock.fiveMinutesRow[i], shape: .rectangle)
                    }
                }
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(berlinClock.singleMinutesRow.indices, id: \.self) { i in
                        LampView(state: berlinClock.singleMinutesRow[i], shape: .rectangle)
                    }
                }
                .frame(maxHeight: 40)
                Spacer()
                Text(context.date, format: .dateTime.hour().minute().second())
                    .font(.system(size: 48, weight: .semibold))
                    .monospacedDigit()
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BerlinClockView()
}
