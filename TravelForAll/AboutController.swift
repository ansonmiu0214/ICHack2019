//
//  AboutController.swift
//  TravelForAll
//
//  Created by Anson Miu on 27/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import UIKit

class AboutController: UIViewController {
  
  
  @IBOutlet weak var paragraphs: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    paragraphs.lineBreakMode = .byWordWrapping
    
    paragraphs.text = "Travelling can be tedious, for instance, having to calculate the exchange rate every time you go shopping and not knowing where to get your necessity, etc. Imagine travelling as a visually impaired or blind person- these tiny inconveniences could turn into huge stepping stones easily." +
    "Eye Travel aims to assist and improves travelling experience of our travellers by providing real-time price-tag scanning and currency exchange services. The  visually-impaired users. It leverages the VISA merchant search API which inform users the nearby supermarkets and convenience stores, and their location and expected queue time. "
  }
  
}
