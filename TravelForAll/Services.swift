//
//  File.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import MapKit

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
//  let test = [
//    Merchant(
//      name: "Starbucks", address: "", walkMinutes: 2, queueMinutes: 2),
//    Merchant(name: "Costa", address: "", walkMinutes: 3, queueMintes: 2),
//  ]
  
  return [
    Merchant(name: "Whole Foot Market", address: "1765 California Street, CA 94109", walkMinutes: 22, coordinate: CLLocationCoordinate2D(latitude: 37.7899512, longitude: -122.4231006)),
    
    Merchant(name: "Mollie Stone's Markets", address: "2435 California Street, CA 94115", walkMinutes: 33, coordinate: CLLocationCoordinate2D(latitude: 37.7887, longitude: -122.4345)),
    
    Merchant(name: "Lucky", address: "1750 Fulton Street, CA 944117", walkMinutes: 34, coordinate: CLLocationCoordinate2D(latitude: 37.7762, longitude: -122.4458))
  ]
}

struct Merchant: Spoken {
  
  let name: String
  let address: String
  let queueMinutes: Int
  let coord: CLLocationCoordinate2D
  
  var walkMinutes: Int
  
  init(name: String, address: String, queueMinutes: Int = 0, walkMinutes: Int = 0, coordinate: CLLocationCoordinate2D) {
    self.name = name
    self.address = address
    self.walkMinutes = walkMinutes
    self.queueMinutes = queueMinutes
    self.coord = coordinate 
  }
  
  func toSpokenString() -> String {
    return "\(self.name) is \(self.walkMinutes) minutes away from you."
  }
  
}
