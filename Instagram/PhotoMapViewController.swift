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
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var captionField: UITextField!
  
  var editedImage : UIImage?
  var window: UIWindow?
  
  @IBAction func onSubmit(_ sender: Any) {
    let caption = captionField.text
    let timestamp = String(Int(NSDate().timeIntervalSince1970))
    print(timestamp)
    Post.postUserImage(image: editedImage, withCaption: caption, withTime: timestamp, withCompletion: {(succeeded, error) -> Void in
      if succeeded {
        print("Successfully uploaded picture");
      } else {
        print("Error in uploading picture");
      }});
    self.performSegue(withIdentifier: "postSegue", sender: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let vc = UIImagePickerController()
    vc.delegate = self
    vc.allowsEditing = true
    vc.sourceType = UIImagePickerControllerSourceType.camera
    
    self.present(vc, animated: true, completion: nil)
    
    /*if UIImagePickerController.isSourceTypeAvailable(.camera) {
      print("Camera is available 📸")
      vc.sourceType = .camera
    } else {*/
      print("Camera 🚫 available so we will use photo library instead")
      vc.sourceType = .photoLibrary
    //}
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
    
    // Do something with the images (based on your use case)
    postImageView.image = editedImage
    captionField.becomeFirstResponder()
    
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
  }
}
