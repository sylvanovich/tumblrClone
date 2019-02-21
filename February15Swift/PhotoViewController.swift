//
//  PhotoViewController.swift
//  February15Swift
//
//  Created by Joseph Sylvanovich on 2/15/19.
//  Copyright © 2019 Joseph Sylvanovich. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    /*
     Recipe for tableViews;
     1) Connect tableView outlet
     2) Add UITableViewDataSource, UITableViewDelegate
     3) tableView.dataSource = self
     tableView.delegate
    4)self.tableView.reloadData()
     
     (add more once we return)
 */

    

    @IBOutlet weak var tableView: UITableView!
    var posts = [[String: Any]]() //this is to store posts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 221

        // Do any additional setup after loading the view.
        //network request, made up of url sections and tasks. function calls, parameters that are passed in
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String: Any]] //self.post is needed because the code is working with a closure. this is because it is in an enclsoure for self.post
                // TODO: Reload the table view
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* let cell = UITableViewCell()
        cell.textLabel!.text = "row: \(indexPath.row)"
        return cell */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellTableViewCell") as! PhotoCellTableViewCell

        let post = posts[indexPath.row] // possible to get a nil value
        if let photos = post["photos"] as? [[String: Any]] {
            //unwraps post. This code block only runs if there's a value in
            
            let photos = photos[0]
            let originalSize = photos["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            
            cell.posterView.af_setImage(withURL: url!)
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
