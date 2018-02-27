//
//  DetailViewController.swift
//  Instagram
//
//  Created by Hye Lim Joun on 2/27/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var timestampLabel: UILabel!
  @IBOutlet weak var captionLabel: UILabel!

  var captionLabelText = ""
  var timestampLabelText = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    captionLabel.text = captionLabelText
    timestampLabel.text = timestampLabelText
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
