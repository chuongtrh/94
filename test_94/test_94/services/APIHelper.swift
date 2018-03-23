//
//  APIHelper.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation
import Alamofire

open class APIHelper {
    class open func createRequest(URLString: String, parameters: Parameters?, method:HTTPMethod, completion:@escaping(_ json:Any?, _ error:Error?)->Void) {
        
        let request = Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            if(response.result.isSuccess){
                if let json = response.result.value {
                    print("JSON: \(json)")
                    completion(json, nil)
                }
            }else{
                completion(nil, response.result.error)
            }
        }
        debugPrint(request)
    }
}
