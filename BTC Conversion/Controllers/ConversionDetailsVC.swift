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
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var conversionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    // MARK: - IBActions
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureViews(){
        guard let conversion = self.conversion, let currency = self.currency else {return}
        currencyLabel.text = "BTC\nto\n\(currency.code!)"
        conversionLabel.text = "1 BTC = \(conversion.price) \(currency.code!)"
    }

    
    
    
}
