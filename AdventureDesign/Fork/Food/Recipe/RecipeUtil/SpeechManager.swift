//
//  SpeechManager.swift
//  AdventureDesign
//
//  Created by 구본정 on 11/1/24.
//

import AVFoundation
import SwiftUI

class SpeechManager: ObservableObject { 
    private var synthesizer = AVSpeechSynthesizer()
    
    func speak(text: String) {
        stopSpeaking()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }

    func stopSpeaking() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }
}

