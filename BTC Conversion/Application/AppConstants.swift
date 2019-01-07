//
//  AppConstants.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation


// MARK: - Keys
var userNameKey = "keyUserName"
let publicKey = "ZDEwNzViMWU0YzJmNDJmY2EyMDA5OTlmMGI1ZWFlOTY"
let secretKey =  "YmFhNGU2NGYyZmE3NGRkNmJlY2NhNTlhYmQ3MWJkZGQ5ZjkyZDZmNTEzYWQ0MTQ3YjFmZTIzMTMxNzlmMzY0MA"


// MARK: - Shared Properties
var sharedUserDefaults = UserDefaults.standard
var dataManager = DataManager.shared


// MARK: - Segues

var currencySelectionSegue = "currencySelectionScreenSegue"
var conversionDetailSegue = "conversionDetailSegue"


// MARK: - URLS

var getBTCFromCurrency = "https://apiv2.bitcoinaverage.com/convert/global"
//?from=BTC&to=USD&amount=2
