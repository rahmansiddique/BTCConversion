//
//  ConversionDetailsVC.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import UIKit

class ConversionDetailsVC: UIViewController {

    // MARK: - Properties
    var conversion:Conversion?
    var currency:Currency?
    
    // MARK: - IBOutlets
    @IBOutlet weak var conversionLabel: UILabel!
    @IBOutlet weak var detailCardView: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    
    // MARK: - Functions    
    private func configureViews(){
        guard let conversion = self.conversion, let currency = self.currency else {return}
        title = "Conversion"
        currencyLabel.text = "BTC\nto\n\(currency.name!)"
        conversionLabel.text = "1 BTC = \(conversion.price) \(currency.code!)"
        detailCardView.layer.cornerRadius = 8.0
        detailCardView.layer.shadowColor = UIColor.black.cgColor
        detailCardView.layer.shadowOpacity = 1
        detailCardView.layer.shadowOffset = CGSize.zero
        detailCardView.layer.shadowRadius = 5
    }
}
