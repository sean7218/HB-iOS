//
//  Bourbon.swift
//  XBourbon
//
//  Created by Sean Zhang on 9/6/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit


class Bourbon: NSObject {
    
    var name: String?
    var proof: Double?
    var price: Double?
    var taste: String?
    var rating: Int?
    var imageUrl: String?
    
    init(name: String, proof: Double, rating: Int, price: Double, taste: String, imageUrl: String) {
        self.name = name
        self.proof = proof
        self.price = price
        self.taste = taste
        self.rating = rating
        self.imageUrl = imageUrl
    }
    
    override init() {
        super.init()
    }
    
}
