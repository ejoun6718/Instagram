//
//  LoginViewController.swift
//  Instagram
//
//  Created by Hye Lim Joun on 2/20/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  @IBAction func onSignIn(_ sender: Any) {
    let username = usernameField.text ?? ""
    let password = passwordField.text ?? ""
    
    if(check()) {
      PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
        if let error = error {
          print("User log in failed: \(error.localizedDescription)")
          let title = "Sign In Failed"
          let message = "Wrong username or password"
          self.showError(title: title, message: message)
        } else {
          print("User logged in successfully")
          // display view controller that needs to shown after successful login
          self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
      }
    }
  }
  
  @IBAction func onSignUp(_ sender: Any) {
    let newUser = PFUser()
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    if(check()) {
      newUser.signUpInBackground { (success: Bool, error: Error?) in
        if let error = error {
          print(error.localizedDescription)
          if(error._code == 202) {
            print("Username is taken");
            let title = "That Username is Taken"
            let message = "Try a different username"
            self.showError(title: title, message: message)
          }
        } else {
          print("Created a new user")
          // display view controller that needs to shown after successful login
          self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
      }
    }
  }
  
  func check() -> Bool {
    if((usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!) {
      
      let title = "Both Fields Required"
      let message = "Please enter your username and password"
      showError(title: title, message: message)
      return false
    }
    return true
  }
  
  func showError(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
      // handle response here.
    }
    // add the OK action to the alert controller
    alertController.addAction(OKAction)
    present(alertController, animated: true) {
      // optional code for what happens after the alert controller has finished presenting
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
