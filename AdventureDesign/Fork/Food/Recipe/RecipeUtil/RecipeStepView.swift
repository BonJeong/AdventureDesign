//
//  RecipeStepView.swift
//  AdventureDesign
//
//  Created by 구본정 on 11/5/24.
//

import SwiftUI

struct RecipeStepView: View {
    @StateObject private var speechManager = SpeechManager()
    @State private var isNextActive = false
    
    let title: String
    let imageName: String
    let instruction: String
    let timerDuration: Int
    let nextView: AnyView

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 50))
                .bold()
                .padding()

            Image(imageName)
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.teal, lineWidth: 3)
                )
                .padding()
            
            Text(instruction)
                .font(.system(size: 30))
                .padding()
                .multilineTextAlignment(.center)
                .onAppear {
                    speechManager.speak(text: instruction)
                }
                .onDisappear {
                    speechManager.stopSpeaking()
                }
            
            MyTimer(initialTime: timerDuration, isActive: $isNextActive)
                .padding()

            Button(action: {
                isNextActive = true
            }) {
                Text("완료")
                    .frame(width: 200, height: 40)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
        }
        .navigationTitle("레시피")
        .navigationDestination(isPresented: $isNextActive) {
            nextView
        }
    }
}
