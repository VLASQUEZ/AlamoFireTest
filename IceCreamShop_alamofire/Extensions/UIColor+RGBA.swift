//
//  UIColor+RGBA.swift
//  IceCreamShop_alamofire
//
//  Created by Andres Velasquez on 27/02/18.
//  Copyright © 2018 Andres Velasquez. All rights reserved.
//

import UIKit
    
public func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    return RGBA(red, green, blue, 255)
}

public func RGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha/255)
}

extension UIColor {
    
    public convenience init?(rgbaString: String) {
        var components = rgbaString.components(separatedBy: ",")
        
        if components.count == 3 {
            components.append("1.0")
        } else if components.count != 4 {
            return nil
        }
        
        guard let redComponent = Float(components[0]),
            let greenComponent = Float(components[1]),
            let blueComponent = Float(components[2]),
            let alphaComponent = Float(components[3]) else {
                return nil
        }
        
        let red = CGFloat(redComponent / 255.0)
        let green = CGFloat(greenComponent / 255.0)
        let blue = CGFloat(blueComponent / 255.0)
        let alpha = CGFloat(alphaComponent / 255.0)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
