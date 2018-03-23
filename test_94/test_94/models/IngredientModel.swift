//
//  IngredientModel.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation
import UIKit

public class IngredientModel: NSObject {
    
    public var yeast:String = ""
    public var malt:[MaltModel]?
    public var hops:[HopsModel]?
    
    
    override init() {
        super.init()
    }
    
    init(json:AnyObject){
        super.init()
        updateWithJson(json: json)
    }
    
    func updateWithJson(json: AnyObject!) {
        
        
        if let yeast = json["yeast"] as? String {
            self.yeast = yeast
        }
        
        if let malt = json["malt"] as? [AnyObject] {
            self.malt = MaltModel.createArrayPhotoWith(json: malt)
        }
        if let hops = json["hops"] as? [AnyObject] {
            self.hops = HopsModel.createArrayPhotoWith(json: hops)
        }
    }
    
    static func createArrayPhotoWith(json:[AnyObject]) -> [IngredientModel] {
        var arr:[IngredientModel] = []
        for item in json {
            arr.append(IngredientModel(json: item))
        }
        return arr
    }
    
    func getTextAtrribute() -> NSAttributedString {
        let attString = NSMutableAttributedString()
        attString.append(NSAttributedString(string: yeast))

        attString.append(NSAttributedString(string: "\n\nMalt:" ,attributes:[NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
        for item in malt! {
            attString.append(NSAttributedString(string: "\n" + item.getText()))
        }
        
        attString.append(NSAttributedString(string: "\n\nHops:" ,attributes:[NSAttributedStringKey.foregroundColor: UIColor.lightGray]))
        for item in hops! {
            attString.append(NSAttributedString(string: "\n" + item.getText()))
        }
        return attString
    }
}
