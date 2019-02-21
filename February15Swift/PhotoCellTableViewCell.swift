//
//  PhotoCellTableViewCell.swift
//  February15Swift
//
//  Created by Joseph Sylvanovich on 2/15/19.
//  Copyright © 2019 Joseph Sylvanovich. All rights reserved.
//

import UIKit

class PhotoCellTableViewCell: UITableViewCell {

    //added on 2/20 @ 11:24pm from poster veiw
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
