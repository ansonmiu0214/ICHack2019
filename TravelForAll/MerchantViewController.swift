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
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    textToSpeech(string: "There are no nearby merchants.")
  }
  
}


