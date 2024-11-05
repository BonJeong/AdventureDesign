//
//  RecipeFinalStep.swift
//  AdventureDesign
//
//  Created by 구본정 on 11/5/24.
//

import SwiftUI

struct RecipeFinalStep: View {
    @StateObject private var speechManager = SpeechManager()

    var body: some View {
        VStack {
            Text("완성!")
                .font(.system(size: 50))
                .bold()
                .padding()
                .onAppear {
                    speechManager.speak(text: "완성!")
                }
                .onDisappear {
                    speechManager.stopSpeaking()
                }
            
            Text("😆")
                .font(.system(size: 100))
                .padding()
            
            NavigationLink(destination: MainView()) {
                Text("메인 화면으로 돌아가기")
                    .frame(width: 200, height: 40)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
        }
        .navigationTitle("레시피")
    }
}

