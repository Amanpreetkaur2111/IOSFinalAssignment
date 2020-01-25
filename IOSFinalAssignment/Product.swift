//
//  Product.swift
//  IOSFinalAssignment
//
//  Created by Amanpreet Kaur on 2020-01-24.
//  Copyright © 2020 Amanpreet Kaur. All rights reserved.
//

import Foundation

class Product {
    internal init(productid: Int, productname: String, productdescription: String, productprice: Int) {
        self.productid = productid
        self.productname = productname
        self.productdescription = productdescription
        self.productprice = productprice
    }
    

    var productid: Int
    var productname: String
    var productdescription : String 
    var productprice: Int
    
    
     static var pdts = [Product]()
}


