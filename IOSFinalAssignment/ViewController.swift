//
//  ViewController.swift
//  IOSFinalAssignment
//
//  Created by Amanpreet Kaur on 2020-01-24.
//  Copyright © 2020 Amanpreet Kaur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var pro_duct: [Product]?
    
    
    @IBOutlet var nameTxt: UITextField!
    
    @IBOutlet var priceTxt: UITextField!
    
    @IBOutlet var id: UITextField!
    
    
    
    
    
    
    
    @IBOutlet var Desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var  product1 = Product(productid: 1, productname: "MacBook", productdescription: "Needed", productprice: 100)
        var  product2 = Product(productid: 2, productname: "Laptop", productdescription: "need", productprice: 10)
        var  product3 = Product(productid: 3, productname: "Microwave", productdescription: "required", productprice: 10)
        var  product4 = Product(productid: 4, productname: "AC", productdescription: "necessary", productprice: 10)
        var  product5 = Product(productid: 5, productname: "Mobile", productdescription: "update", productprice: 900)
        var  product6 = Product(productid: 6, productname: "Images", productdescription: "something", productprice: 800)
        var  product7 = Product(productid: 7, productname: "Bottle", productdescription: "super", productprice: 500)
        var  product8 = Product(productid: 8, productname: "Mouse", productdescription: "fifth", productprice: 700)
        var  product9 = Product(productid: 9, productname: "Keyboard", productdescription: "sixth", productprice: 600)
        var  product10 = Product(productid: 10, productname: "Perfume", productdescription: "eight", productprice: 120)
            
        pro_duct =  [product1,product2,product3,product4,product5,product6,product7,product8,product9,product10]
            
            for p in pro_duct!{
                
                Product.pdts.append(p)
                
            }
        
        
//      nameTxt.text = "\(Product.pdts)"
//       id.text = "\(Product.pdts)"
//        priceTxt.text = "\(Product.pdts)"
//        //Desc.text = "\(Product.pdts)"
        
        
        
        
    }


}

