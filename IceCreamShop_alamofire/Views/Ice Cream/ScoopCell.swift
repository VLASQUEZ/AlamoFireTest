//
//  ScoopCellCollectionViewCell.swift
//  IceCreamShop_alamofire
//
//  Created by Andres Velasquez on 27/02/18.
//  Copyright © 2018 Andres Velasquez. All rights reserved.
//

import UIKit

class ScoopCell: UICollectionViewCell {
    // MARK Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scoopView: ScoopView!
    
    
    // MARK: UIView
    public override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius = 10.0
    }
}

//MARK: FlavorAdapter
extension ScoopCell: FlavorAdapter{
    public func update(with flavor: Flavor){
        scoopView.topColor = flavor.topColor
        scoopView.bottomColor = flavor.bottomColor
        scoopView.setNeedsDisplay()
        textLabel.text = flavor.name
    }
}
