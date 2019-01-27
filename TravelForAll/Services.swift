//
//  File.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation

enum POI_TYPES {
  case CONVENIENT_STORE
  case COFFEE_SHOP
}

protocol Spoken {
  func toSpokenString() -> String
}

let currencyToRate: [String:Float] = [
  "$": 0.78,
  "£": 1,
  "¥": 0.01,
  "€": 0.89
]

func getHomePrice(currency: String, value: Float) -> Float? {
  if let rate = currencyToRate[currency] {
    return round(value * rate * 100) / 100
  }
  
  return nil
}

func getMerchants() -> [Merchant] {
  return [
    Merchant(name: "Starbucks", address: "", walkMinutes: 2),
    Merchant(name: "Costa", address: "", walkMinutes: 3),
  ]
}

struct Merchant: Spoken {
  
  let name: String
  let address: String
  let walkMinutes: Int
  
  init(name: String, address: String, walkMinutes: Int) {
    self.name = name
    self.address = address
    self.walkMinutes = walkMinutes
  }
  
  func toSpokenString() -> String {
    return "\(self.name) is \(self.walkMinutes) minutes away from you."
  }
  
}
