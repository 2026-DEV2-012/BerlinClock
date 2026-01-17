//
//  LampView.swift
//  BerlinClock
//
//  Created by Julien Henrard on 17/01/2026.
//

import SwiftUI

enum LampShape {
    case round, rectangle
}

struct LampView: View {
    
    private let borderWidth: CGFloat = 2
    private let cornerRadius: CGFloat = 4
    let state: LampState
    let shape: LampShape
    
    private var color: Color {
        switch state {
        case .off: return .gray.opacity(0.3)
        case .yellow: return .yellow
        case .red: return .red
        }
    }
    
    var body: some View {
        Group {
            switch shape {
            case .round:
                Circle()
                    .fill(color)
                    .overlay(stroke)
            case .rectangle:
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
                    .overlay(stroke)
            }
        }
    }
    
    @ViewBuilder
    private var stroke: some View {
        switch shape {
        case .round: Circle().stroke(Color.gray, lineWidth: borderWidth)
        case .rectangle: RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.gray, lineWidth: borderWidth)
        }
    }
}

#Preview {
    VStack {
        Text("Rounded Lamps")
        HStack {
            LampView(state: .yellow, shape: .round)
            LampView(state: .red, shape: .round)
            LampView(state: .off, shape: .round)
        }
        .frame(maxHeight: 80)
        .padding(.horizontal)
        Text("Rectangle Lamps")
        HStack {
            LampView(state: .yellow, shape: .rectangle)
            LampView(state: .red, shape: .rectangle)
            LampView(state: .off, shape: .rectangle)
        }
        .frame(maxHeight: 80)
        .padding(.horizontal)
    }
}
