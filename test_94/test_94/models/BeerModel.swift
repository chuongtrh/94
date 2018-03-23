//
//  BeerModel.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation

public class BeerModel: NSObject {
    public var id: Int32 = 0
    public var name:String = ""
    public var descriptionString:String = ""
    public var image_url:String = ""
    
    public var first_brewed:String = ""
    public var ingredients:IngredientModel?
    
    override init() {
        super.init()
    }
    
    init(json:AnyObject){
        super.init()
        updateWithJson(json: json)
    }

    func updateWithJson(json: AnyObject!) {
        
        if let id = json["id"] as? Int32 {
            self.id = id
        }
        if let name = json["name"] as? String {
            self.name = name
        }
        if let description = json["description"] as? String {
            self.descriptionString = description
        }
        if let image_url = json["image_url"] as? String {
            self.image_url = image_url
        }
        
        if let first_brewed = json["first_brewed"] as? String {
            self.first_brewed = first_brewed
        }
        
        if let ingredients = json["ingredients"] as AnyObject! {
            self.ingredients = IngredientModel(json: ingredients)
        }
    }
    
    static func createArrayPhotoWith(json:[AnyObject]) -> [BeerModel] {
        var arr:[BeerModel] = []
        for item in json {
            arr.append(BeerModel(json: item))
        }
        return arr
    }
}
