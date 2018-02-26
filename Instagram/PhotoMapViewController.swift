//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by Hye Lim Joun on 2/24/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit
import Parse

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    vc.sourceType = UIImagePickerControllerSourceType.camera
    
    self.present(vc, animated: true, completion: nil)
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      print("Camera is available 📸")
      vc.sourceType = .camera
    } else {
      print("Camera 🚫 available so we will use photo library instead")
      vc.sourceType = .photoLibrary
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do something with the images (based on your use case)
    Post.postUserImage(image: editedImage, withCaption: "", withCompletion: {(succeeded, error) -> Void in
      if succeeded {
        print("Successfully uploaded picture");
      } else {
        print("Error in uploading picture");
      }});
    
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
  }
}
