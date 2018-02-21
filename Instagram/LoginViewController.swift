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
  }
  @IBAction func onSignUp(_ sender: Any) {
      let newUser = PFUser()
    
      newUser.username = usernameField.text
      newUser.password = passwordField.text
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
