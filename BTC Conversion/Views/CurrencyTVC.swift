//
//  CurrencyTVC.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 08/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import UIKit

class CurrencyTVC: UITableViewCell {

    
    // MARK: - IBOutlets
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(currency:Currency){
        codeLabel.text = currency.code
        nameLabel.text = currency.name
    }
}
