//
//  ViewController.swift
//  IceCreamShop_alamofire
//
//  Created by Andres Velasquez on 27/02/18.
//  Copyright © 2018 Andres Velasquez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // MARK: Instance Properties
    public var flavors: [Flavor] = []
    fileprivate let flavorFactory = FlavorFactory()
    // MARK: Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var iceCreamView: IceCreamView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFlavors()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Consumo con AlamoFire
    fileprivate func loadFlavors(){
        Alamofire.request("https://www.raywenderlich.com/downloads/Flavors.plist",
                          method: .get, parameters: nil, encoding:PropertyListEncoding(format: .xml, options: 0) , headers: nil).responsePropertyList { (response) in
                            let strongSelf = self
                            guard response.result.isSuccess,
                            let dictionaryArray = response.result.value as? [[String: String]] else {
                                return
                            }
                            strongSelf.flavors = strongSelf.flavorFactory.flavors(from: dictionaryArray)
                            
                            strongSelf.collectionView.reloadData()
                            strongSelf.selectFirstFlavor()
            
            }
    }
    fileprivate func selectFirstFlavor() {
        guard let flavor = flavors.first else {
            return
        }
        update(with: flavor)
    }
}

// MARK: - FlavorAdapter
extension ViewController: FlavorAdapter {
    
    public func update(with flavor: Flavor) {
        iceCreamView.update(with: flavor)
        label.text = flavor.name
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    private struct CellIdentifiers {
        static let scoop = "ScoopCell"
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flavors.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.scoop, for: indexPath) as! ScoopCell
        let flavor = flavors[indexPath.row]
        cell.update(with: flavor)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flavor = flavors[indexPath.row]
        update(with: flavor)
    }
}

