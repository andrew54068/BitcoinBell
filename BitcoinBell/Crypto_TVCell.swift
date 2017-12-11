//
//  Crypto_TVCell.swift
//  BitcoinBell
//
//  Created by kidnapper on 09/12/2017.
//  Copyright © 2017 kidnapper.com. All rights reserved.
//

import UIKit

class Crypto_TVCell: UITableViewCell {

    @IBOutlet var containView: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var symbol: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var volume: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containView.backgroundColor = UIColor.cyan
        containView.layer.cornerRadius = 10
//        containView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
