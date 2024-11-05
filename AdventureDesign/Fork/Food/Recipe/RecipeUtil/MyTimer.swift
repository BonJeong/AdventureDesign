//
//  MyTimer.swift
//  AdventureDesign
//
//  Created by 구본정 on 10/30/24.
//


import Combine
import SwiftUI

struct MyTimer: View {
    let initialTime: Int
    @Binding var isActive: Bool

    @State private var timeRemaining: Int
    @State private var cancellable: Cancellable?

    let timer = Timer.publish(every: 1, on: .main, in: .common)

    init(initialTime: Int, isActive: Binding<Bool>) {
        self.initialTime = initialTime
        _timeRemaining = State(initialValue: initialTime)
        _isActive = isActive
    }

    var body: some View {
        VStack {
            Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                .font(.system(size: 50))
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        isActive = true 
                        cancellable?.cancel()
                    }
                }
        }
        .onAppear {
            timeRemaining = initialTime
            startTimer()
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }

    private func startTimer() {
        cancellable?.cancel()
        cancellable = timer.connect()
    }

    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
