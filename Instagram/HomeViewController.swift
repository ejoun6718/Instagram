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
    //tableView.rowHeight = UITableViewAutomaticDimension
    tableView.rowHeight = 400
    
    let refreshControl = UIRefreshControl()
    refreshControlAction(refreshControl)
    refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
    // add refresh control to table view
    tableView.insertSubview(refreshControl, at: 0)
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
    
    if let photo = posts[indexPath.row]["media"] as? PFFile {
      photo.getDataInBackground({ (imageData: Data?, error: Error?) -> Void in
        let image = UIImage(data: imageData!)
        if image != nil {
          cell.photoImageView.image = image
        }
      })
    }
    
    if let user = posts[indexPath.row]["user"] as? PFUser {
      // User found! update username label with username
      cell.usernameLabel.text = user.username
    } else {
      // No user found, set default username
      cell.usernameLabel.text = "🤖"
    }
    
    return cell
  }
  
  @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
    let query = PFQuery(className: "Post")
    query.addDescendingOrder("createdAt")
     
     query.findObjectsInBackground (block: { (postdata: [PFObject]?, error: Error?) -> Void in
      if let postdata = postdata {
        self.posts = postdata
        self.tableView.reloadData()
        
      } else {
        print (error?.localizedDescription ?? "Error fetching messages")
      }
    })
    refreshControl.endRefreshing()
  }
}
