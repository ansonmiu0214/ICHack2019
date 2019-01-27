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

var disabledMode = false

//let homeCurrency = "£"
//let currencyToString = [
//  "$": "dollars", // TODO also depend on locale (US dollars vs HK dollars vs Australian dollars)
//  "£": "Stirling pounds",
//  "¥": "Japanese yen",
//  "€": "Euro"
//]

let currentCity = "London"

let homeCurrency = "$"
let currencyToString = [
  "$": "Hong Kong dollars", // TODO also depend on locale (US dollars vs HK dollars vs Australian dollars)
  "£": "Stirling pounds",
  "¥": "Japanese yen",
  "€": "Euro"
]


class Speaker: NSObject, AVSpeechSynthesizerDelegate {
  
  let rateFactor: Float = 1
  let synth: AVSpeechSynthesizer
  var completionHandler: (() -> ())? = nil
  
  override init() {
    self.synth = AVSpeechSynthesizer()
    super.init()
    synth.delegate = self
  }
  
  func textToSpeech(_ string: String, _ completion: Action? = nil) {
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


extension String {
  subscript (bounds: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start...end])
  }
  
  subscript (bounds: CountableRange<Int>) -> String {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return String(self[start..<end])
  }
}
