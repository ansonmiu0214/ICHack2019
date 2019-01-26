//
//  MockLocationService.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import CoreLocation

class MockLocationService {
  
  fileprivate init() {
    
  }
  
  func getCurrentLocation() {
    
  }
  
}

fileprivate var mockLocationService: MockLocationService? = nil

func getLocationService() -> MockLocationService {
  if mockLocationService == nil {
    mockLocationService = MockLocationService()
  }
  
  return mockLocationService!
}

