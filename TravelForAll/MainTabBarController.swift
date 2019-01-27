//
//  MainTabBarController.swift
//  TravelForAll
//
//  Created by Anson Miu on 27/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
  
  var goToSegue: Int? = nil
  
  override func viewDidLoad() {
    if let segueNumber = goToSegue {
      selectedIndex = segueNumber
    }
  }
  
}
