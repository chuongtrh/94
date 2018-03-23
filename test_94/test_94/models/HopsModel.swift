//
//  HopsModel.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation

public class HopsModel: NSObject {
    
    public var amount: AmountModel?
    public var name:String = ""
    public var add:String = ""
    public var attribute:String = ""

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
        if let add = json["add"] as? String {
            self.add = add
        }
        if let attribute = json["attribute"] as? String {
            self.attribute = attribute
        }
    }
    
    static func createArrayPhotoWith(json:[AnyObject]) -> [HopsModel] {
        var arr:[HopsModel] = []
        for item in json {
            arr.append(HopsModel(json: item))
        }
        return arr
    }
    
    func getText() -> String! {
        return String(format:"\t• %@, %@, %@, %@", add, attribute, (amount?.getText())!, name)
    }
}
