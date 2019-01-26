//
//  FirstViewController.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

  @IBOutlet weak var mapView: MKMapView!
  
  let speaker = Speaker()
  
  var coordFrom: CLLocationCoordinate2D? = nil
  var navigateTo: Merchant? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    print("Map did load!")
    
    self.mapView.delegate = self
    computeDirections()
  }
  
  func computeDirections() {
    // Error handling for undefined values
//    guard var from = coordFrom else {
//      print("FROM coordinate is nil")
//      return
//    }
    
    guard var merchant = navigateTo else {
      print("MERCHANT is nil")
      return
    }
    
    speaker.textToSpeech("Computing directions to \(merchant.name).")
    
    // Setup request
    let request  = MKDirections.Request()
    
    let testFrom = CLLocationCoordinate2D(latitude: 51.4944, longitude: -0.1827)
    let testTo = CLLocationCoordinate2D(latitude: 51.4988, longitude: -0.1749)
    
    let from = testFrom
    let to = testTo
    
    request.source = MKMapItem(placemark: MKPlacemark(coordinate: from))
    request.destination = MKMapItem(placemark: MKPlacemark(coordinate: to))
    
    request.transportType = .walking
    
    let directions = MKDirections(request: request)
    
    directions.calculate { [unowned self] response, error in
      guard let unwrappedResponse = response else { return }
      
      
      for route in unwrappedResponse.routes {
        self.mapView.addOverlay(route.polyline)
        self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
      }
      
    }
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
    renderer.strokeColor = UIColor.blue
    return renderer
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    Speaker().textToSpeech("Hello, world!", nil)
  }


}

