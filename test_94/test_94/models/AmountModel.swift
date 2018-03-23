//
//  AmountModel.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation

public class AmountModel: NSObject {
    
    public var value: Float = 0
    public var unit:String = ""
    
    init(json:AnyObject){
        super.init()
        updateWithJson(json: json)
    }
    
    func updateWithJson(json: AnyObject!) {
        
        if let value = json["value"] as? Float {
            self.value = value
        }
        if let unit = json["unit"] as? String {
            self.unit = unit
        }
    }
    
    static func createArrayPhotoWith(json:[AnyObject]) -> [AmountModel] {
        var arr:[AmountModel] = []
        for item in json {
            arr.append(AmountModel(json: item))
        }
        return arr
    }
    
    func getText() -> String! {
        return "\(value) \(unit)"
    }
}
