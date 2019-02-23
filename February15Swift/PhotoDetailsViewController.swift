//
//  PhotoDetailsViewController.swift
//  February15Swift
//
//  Created by Joseph Sylvanovich on 2/22/19.
//  Copyright © 2019 Joseph Sylvanovich. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {
    
    var photoUrlString: String = ""
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        print(photoUrlString)
        let url = URL(string: photoUrlString)
        myImage.af_setImage(withURL: url!)
        
        
        // Do any additional setup after loading the view.
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
