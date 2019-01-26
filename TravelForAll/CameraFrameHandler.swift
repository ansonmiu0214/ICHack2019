//
//  CameraFrameHandler.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import Foundation
import AVKit

protocol ResponseDataHandler {
  // Pass in object and price?
  // Pass in the relevant things required for the camera view controller to render or speak
}

class CameraFrameHandler: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
  
  let responseDelegate: ResponseDataHandler
  
  init(responseDelegate: ResponseDataHandler) {
    self.responseDelegate = responseDelegate
    super.init()
  }
  
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    print("Got a frame!")
    
    let image = imageFromSampleBuffer(sampleBuffer: sampleBuffer)
    
    
  }
  
  private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> UIImage? {
    guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
    let ciImage = CIImage(cvPixelBuffer: imageBuffer)
    let context = CIContext()
    guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil }
    return UIImage(cgImage: cgImage)
  }
  
  
}
