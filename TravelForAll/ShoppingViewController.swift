//
//  SecondViewController.swift
//  TravelForAll
//
//  Created by Anson Miu on 26/1/2019.
//  Copyright © 2019 Anson Miu. All rights reserved.
//

import UIKit
import AVKit

class ShoppingViewController: UIViewController {

  var captureSession: AVCaptureSession?
  var videoPreviewLayer: AVCaptureVideoPreviewLayer?

  var frameDelegate: CameraFrameHandler? = nil
  
  @IBOutlet weak var viewFinder: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    askForCameraPermissions { [unowned self] granted in
      if !granted {
        return
      }
      
      self.frameDelegate = CameraFrameHandler(responseDelegate: self)
      
      
      self.setupCaptureSession()
    }
  }
  
  func askForCameraPermissions(_ completion: @escaping (Bool) -> Void) {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .authorized: // The user has previously granted access to the camera.
      print("OK")
      completion(true)
      
    case .notDetermined: // The user has not yet been asked for camera access.
      AVCaptureDevice.requestAccess(for: .video) { granted in
        completion(granted)
      }
      
    case .denied: // The user has previously denied access.
      print("Denied")
      completion(false)

    case .restricted: // The user can't grant access due to restrictions.
      print("Restriction problems")
      completion(false)
    }
  }
  
  func setupCaptureSession() {
    // Setup camera
    let captureDevice = AVCaptureDevice.default(for: .video)
    
    let input: AVCaptureDeviceInput?
    do {
      input = try AVCaptureDeviceInput(device: captureDevice!)
    } catch {
      input = nil
      print(error)
    }
    
    guard let cameraInput = input else {
      // Error
      return
    }
    
    captureSession = AVCaptureSession()
    captureSession?.addInput(cameraInput)
    
    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
    videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
    videoPreviewLayer?.frame = view.layer.bounds
    viewFinder.layer.addSublayer(videoPreviewLayer!)
    
    // Add delegate
    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(frameDelegate, queue: DispatchQueue(label: "frame buffer"))
    captureSession?.addOutput(videoOutput)
    
    captureSession?.startRunning()
  }


}

extension ShoppingViewController: ResponseDataHandler {
  
}
