//
//  ServiceManager.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ServiceManager{
    
    func simpleRequest(url:String,parameters:[String:String], success: @escaping ((_ converted:Conversion) -> Void), failureBlock failure: @escaping ((_ error: Error?) -> Void)){
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response:DataResponse<Conversion>) in
            if let conversionObject = response.result.value {
                success(conversionObject)
            }else{
                failure(response.error)
            }
        }
    }
}
