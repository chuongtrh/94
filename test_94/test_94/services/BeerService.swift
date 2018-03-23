//
//  BeerService.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation


open class BeerService {
    
    class open func getListBeer(page:Int, completion: @escaping (_ beers:[BeerModel], _ error:Error?) ->Void) {
        
        let URLString = URL_API_ENDPOINT + "/beers?page=\(page)"
        
        APIHelper.createRequest(URLString: URLString, parameters: [:], method: .get) { (json, error) in
            if(error != nil){
                completion([], error)
            }else{
                if let dataJson = json as? [AnyObject] {
                    completion(BeerModel.createArrayPhotoWith(json: dataJson), error)
                }
            }
        }
    }
    
    class open func getBeerDetail(id:Int32, completion: @escaping (_ beer:BeerModel?, _ error:Error?) ->Void) {
        
        let URLString = URL_API_ENDPOINT + "/beers/\(id)"
        
        APIHelper.createRequest(URLString: URLString, parameters: [:], method: .get) { (json, error) in
            if(error != nil){
                completion(nil, error)
            }else{
                if let dataJson = json as? [AnyObject] {
                    completion(BeerModel(json: dataJson[0]), error)
                }
            }
        }
    }
}
