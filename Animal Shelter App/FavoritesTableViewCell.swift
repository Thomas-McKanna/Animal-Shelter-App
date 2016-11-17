//
//  FavoritesTableViewCell.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/16/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    // properties
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBreed: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var imgviewPhoto: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
