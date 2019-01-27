//
//  CameraFrameHandler.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import AVKit
import FirebaseMLVision

protocol ResponseDataHandler {
  // Pass in object and price?
  // Pass in the relevant things required for the camera view controller to render or speak
}

class CameraFrameHandler: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
  
  let responseDelegate: ShoppingViewController
  private lazy var vision = Vision.vision()
  private lazy var textRecognizer = vision.onDeviceTextRecognizer()
  
  var isProcessing = false
  
  init(responseDelegate: ShoppingViewController) {
    self.responseDelegate = responseDelegate
    super.init()

  }
  
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//    print("Got a frame!")

//    if !responseDelegate.enable || isProcessing {
    if isProcessing {
//      print("Dropping frame")
      return
    }
    
    if let image = imageFromSampleBuffer(sampleBuffer: sampleBuffer) {
      isProcessing = true
      runTextRecognition(with: image)
    }
    
  }
  
  
  private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> UIImage? {
    guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
    let ciImage = CIImage(cvPixelBuffer: imageBuffer)
    let context = CIContext()
    guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
    return UIImage(cgImage: cgImage)
  }
  
  func runTextRecognition(with image: UIImage) {
    let visionImage = VisionImage(image: image)

    DispatchQueue.global(qos: .background).async { [unowned self] in
      self.textRecognizer.process(visionImage) { features, error in
        self.processResult(from: features, error: error)
        
        self.isProcessing = false
        self.responseDelegate.enable = false
      }
    }
  }
  
  func processResult(from text: VisionText?, error: Error?) {
    print("**Result start**")
    text?.blocks.forEach { block in
      block.lines.forEach { line in
//        print(line.text)
        line.elements.forEach { element in
          let text = element.text
          
          if isMoney(text) {
            let (currency, value) = getMoneyValue(text)
            print(value)
          }
          
//          print(element.text)
        }
      }
    }
    print("**Result end**")
  }
  
  func isMoney(_ text: String) -> Bool {
    return text[0...0]  == "$"
  }
  
  func getMoneyValue(_ text: String) -> (String, Float) {
    let end = text.count
    return (text[0...0], Float(text[1..<end])!)
  }

  
  
}


/*
 //
 //  ImageRecognition.swift
 //  TravelForAll
 //
 //  Created by Sharen Choi on 26/1/2019.
 //  Copyright © 2019 Anson Miu. All rights reserved.
 //
 
 import Foundation
 import UIKit
 import FirebaseMLVision
 class ViewController : UIViewController{
 
 private lazy var vision = Vision.vision()
 private lazy var textRecognizer = vision.onDeviceTextRecognizer()
 
 func runTextRecognition(with image: UIImage) {
 let visionImage = VisionImage(image: image)
 textRecognizer.process(visionImage) { features, error in
 self.processResult(from: features, error: error)
 }
 }
 func processResult(from text: VisionText?, error: Error?) {
 text?.blocks.forEach { block in
 print(block.text)
 }
 //        removeDetectionAnnotations()
 //        guard error == nil, let text = text else {
 //            let errorString = error?.localizedDescription ?? Constants.detectionNoResultsMessage
 //            print("Text recognizer failed with error: \(errorString)")
 //            return
 //        }
 //
 //        let transform = self.transformMatrix()
 //
 //        // Blocks.
 //        for block in text.blocks {
 //            drawFrame(block.frame, in: .purple, transform: transform)
 //
 //            // Lines.
 //            for line in block.lines {
 //                drawFrame(line.frame, in: .orange, transform: transform)
 //
 //                // Elements.
 //                for element in line.elements {
 //                    drawFrame(element.frame, in: .green, transform: transform)
 //
 //                    let transformedRect = element.frame.applying(transform)
 //                    let label = UILabel(frame: transformedRect)
 //                    label.text = element.text
 //                    label.adjustsFontSizeToFitWidth = true
 //                    self.annotationOverlayView.addSubview(label)
 //                }
 //            }
 //        }
 }
 
 }
 */
