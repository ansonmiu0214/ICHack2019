//
//  MerchantCell.swift
//  TravelForAll
//
//  Created by Anson Miu on 27/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import UIKit

class MerchantCell: UITableViewCell {
  
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var minuteLabel: UILabel!
  @IBOutlet weak var mapButton: UIButton!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  
  var merchant: Merchant? = nil
  var tableViewController: MerchantTableViewController? = nil
  
  @IBAction func onButtonClick(_ sender: Any) {
    tableViewController!.goToMap(merchant!)
  }
  
}
