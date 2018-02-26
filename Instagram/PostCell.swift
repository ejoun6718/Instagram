//
//  PostCell.swift
//  Instagram
//
//  Created by Hye Lim Joun on 2/26/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
