//
//  DataManager.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation


class DataManager: NSObject {
    
    // MARK: - Properties
    static let shared = DataManager()
    
    // MARK: - Initializer
    private override init() {}
    
    // MARK: - Functions
    func getUserName()->String{
        guard let userName = sharedUserDefaults.string(forKey: userNameKey) else {return ""}
        return userName
    }
    func saveUserName(userName:String){
        sharedUserDefaults.setValue(userName, forKey: userNameKey)
        sharedUserDefaults.synchronize()
    }
    
}
