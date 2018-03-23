//
//  MaltModel.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation

public class MaltModel: NSObject {
    
    public var amount: AmountModel?
    public var name:String = ""
    
    init(json:AnyObject){
        super.init()
        updateWithJson(json: json)
    }
    
    func updateWithJson(json: AnyObject!) {
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
        if let amount = json["amount"] as AnyObject? {
            self.amount = AmountModel(json: amount)
        }
    }
    
    static func createArrayPhotoWith(json:[AnyObject]) -> [MaltModel] {
        var arr:[MaltModel] = []
        for item in json {
            arr.append(MaltModel(json: item))
        }
        return arr
    }
    
    func getText() -> String! {
        return String(format:"\t• %@, %@", (amount?.getText())!, name)
    }
}
