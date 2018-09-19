//
//  Product.swift
//  Sample_TableView
//
//  Created by Esat Kemal Ekren on 5.04.2018.
//  Copyright © 2018 Esat Kemal Ekren. All rights reserved.
//

import UIKit

struct Product {
    var isExpand : Bool
    var info: String
    var data : [Item]
}

struct Item {
    var productName : String
    var productImage : UIImage
    var productDesc : String
}