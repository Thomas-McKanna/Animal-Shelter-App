//
//  StepTableViewCell.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 12/5/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class StepTableViewCell: UITableViewCell {

    @IBOutlet weak var stepLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
