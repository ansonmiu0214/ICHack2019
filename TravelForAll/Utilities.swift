//
//  Utilities.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import AVFoundation

typealias Action = () -> ()

class Speaker: NSObject, AVSpeechSynthesizerDelegate {
  
  let rateFactor: Float = 0.75
  let synth: AVSpeechSynthesizer
  var completionHandler: (() -> ())? = nil
  
  override init() {
    self.synth = AVSpeechSynthesizer()
    super.init()
    synth.delegate = self
  }
  
  func textToSpeech(_ string: String, _ completion: Action?) {
    completionHandler = completion
    
    let utterance = AVSpeechUtterance(string: string)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate * rateFactor
    
    synth.speak(utterance)
  }
  
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    if let completion = completionHandler {
      completion()
    }
  }

  
}



