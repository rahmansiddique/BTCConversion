//
//  Currency.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class Currency: NSObject {
 
    var name:String!
    var code:String!
    
    init(name:String, code:String) {
        self.name = name
        self.code = code
    }
    
    func btcValue(success: @escaping ((_ converted:Conversion) -> Void),
                   failureBlock failure: @escaping ((_ error: Error?) -> Void)){
        let serviceManager = ServiceManager()
        serviceManager.simpleRequest(url: getBTCFromCurrency, parameters: ["from":"BTC", "to":code], success: { (conversion) in
            success(conversion)
        }) { (error) in
            failure(error)
        }
    }
}

// HMAC Calulations commented for now

/*let currentDateTimeInterval = Int(Date().timeIntervalSince1970)
 var digestValue = "\(currentDateTimeInterval)" + "." + publicKey
 digestValue = digestValue.hmac(algorithm: HMACAlgorithm.SHA256, key: secretKey)
 var finalPayload = "\(currentDateTimeInterval)" + "." + publicKey + "." + digestValue
 print(finalPayload)*/
