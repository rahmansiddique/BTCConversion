//
//  Conversion.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Conversion: Mappable {
    var success: Bool = false
    var time: String = ""
    var price: Double = 0
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        success <- map["success"]
        time <- map["time"]
        price <- map["price"]
    }
}
