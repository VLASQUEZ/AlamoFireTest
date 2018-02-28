//
//  Flavor.swift
//  IceCreamShop_alamofire
//
//  Created by Andres Velasquez on 27/02/18.
//  Copyright © 2018 Andres Velasquez. All rights reserved.
//

import UIKit

// MARK: FlavorAdapter
protocol FlavorAdapter{
    func update(with flavor : Flavor)
}
// MARK: Flavor
public struct Flavor {
    public static var chocolate: Flavor{
        return Flavor(name:"Chocolate", topColor: RGB(203,140,58), bottomColor: RGB(107,46,11))
    }
    public static var vanilla: Flavor {
        return Flavor(name: "Vanilla", topColor: RGB(251, 248, 236), bottomColor: RGB(230, 215, 171))
    }
    // MARK: Instance Properties
    public let name: String
    public let topColor: UIColor
    public let bottomColor: UIColor
    
    // MARK: Object Lifecycle
    public init?(dictionary:[String: String]){
        guard let topColorString = dictionary["topColor"],
        let bottomColorString = dictionary["bottomColor"],
        let name = dictionary["name"],
        let topColor = UIColor(rgbaString: topColorString),
        let bottomColor = UIColor(rgbaString: bottomColorString) else {
                return nil
        }
        self.init(name: name, topColor: topColor, bottomColor: bottomColor)
    }
    public init (name: String, topColor: UIColor, bottomColor: UIColor){
        self.name = name
        self.topColor = topColor
        self.bottomColor = bottomColor
    }
    
}


