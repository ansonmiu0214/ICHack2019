//
//  MerchantViewController.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import UIKit

class MerchantViewController: UIViewController {
  
  var nearbyMerchants: [Merchant] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nearbyMerchants = getMerchants()
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    
    let speaker = Speaker()
//    var speech = ""
    
    let merchantCount = nearbyMerchants.count
    if merchantCount == 0 {
      speaker.textToSpeech("There are no nearby merchants.")
    } else {
      speaker.textToSpeech("There are \(merchantCount) nearby merchants.")
      for merchant in nearbyMerchants {
        speaker.textToSpeech(merchant.toSpokenString())
//        speech += merchant.toSpokenString()
      }
    }
    
//    Speaker().textToSpeech(speech) {
//      print("Finished speaking!")
//    }
  }
  
}


