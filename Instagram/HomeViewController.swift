//
//  HomeViewController.swift
//  Instagram
//
//  Created by Hye Lim Joun on 2/24/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var posts = [PFObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 50
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.refresh), userInfo: nil, repeats: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    cell.selectionStyle = .none
    
    // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    //cell.photoImageView.set
      //= messages[indexPath.row]["text"] as? String
    
    if let user = posts[indexPath.row]["user"] as? PFUser {
      // User found! update username label with username
      cell.usernameLabel.text = user.username
    } else {
      // No user found, set default username
      cell.usernameLabel.text = "🤖"
    }
    
    return cell
  }
  
  @objc func refresh() {
    let query = PFQuery(className: "Post")
    //query.includeKey("user")
    query.addDescendingOrder("createdAt")
    
    query.findObjectsInBackground (block: { (postdata: [PFObject]?, error: Error?) -> Void in
      if let postdata = postdata {
        self.posts = postdata
        self.tableView.reloadData()
        
      } else {
        print (error?.localizedDescription ?? "Error fetching messages")
      }
    })
  }
}
