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
  
  func getCurrentLocation() -> CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: 37.7762, longitude: -122.4458)
  }
  
}

fileprivate var mockLocationService: MockLocationService? = nil

func getLocationService() -> MockLocationService {
  if mockLocationService == nil {
    mockLocationService = MockLocationService()
  }
  
  return mockLocationService!
}

