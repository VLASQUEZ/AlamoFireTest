//
//  FlavorFactory.swift
//  IceCreamShop_alamofire
//
//  Created by Andres Velasquez on 27/02/18.
//  Copyright © 2018 Andres Velasquez. All rights reserved.
//

import Foundation

class FlavorFactory: NSObject {

    public func flavorsFromList(named plistName: String, in bundle: Bundle = Bundle.main) -> [Flavor]{
        let path = bundle.path(forResource: plistName, ofType: "plist")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let options = PropertyListSerialization.MutabilityOptions()
        let array = try! PropertyListSerialization.propertyList(from: data, options: options, format: nil) as! [[String: String]]
        return flavors(from: array)
    }
    
    public func flavors(from dictionaryArray: [[String: String]])-> [Flavor]{
        var flavors: [Flavor] = []
        for dictionary in dictionaryArray{
            if let flavor = Flavor(dictionary: dictionary){
                flavors.append(flavor)
            }
        }
        return flavors
    }
}
