//
//  cryptoCell.swift
//  BitcoinBell
//
//  Created by kidnapper on 03/11/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class cryptoCell: UITableViewCell {

    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var symbol: UILabel!
    @IBOutlet var price: UILabel!
    
    @IBOutlet var cap: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("awake from nib message")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.backgroundColor = UIColor.cyan

        // Configure the view for the selected state
    }

}
