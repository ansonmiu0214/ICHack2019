//
//  Utilities.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import AVFoundation

func textToSpeech(string: String) {
  let utterance = AVSpeechUtterance(string: string)
  utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
  
  let synth = AVSpeechSynthesizer()
  synth.speak(utterance)

}
