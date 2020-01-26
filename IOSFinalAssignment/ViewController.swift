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

    var pro_duct: Product?
     var delegate : ProductTableViewController?
    
    @IBOutlet var showpro: UIBarButtonItem!
    var viewContext : NSManagedObjectContext?
    
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var priceTxt: UITextField!
    @IBOutlet var id: UITextField!
     @IBOutlet var Desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pro_duct = delegate?.g_Product()
        
        if Product.pdts.count > 9 {
        return
            
        } else
        {
        
        Product.pdts.append(Product(productid: 1, productname: "MacBook", productdescription: "Needed", productprice: 100))
        Product.pdts.append(Product(productid: 2, productname: "Laptop", productdescription: "need", productprice: 10))
        Product.pdts.append(Product(productid: 3, productname: "Microwave", productdescription: "required", productprice: 10))
        Product.pdts.append(Product(productid: 4, productname: "AC", productdescription: "necessary", productprice: 10))
       Product.pdts.append(Product(productid: 5, productname: "Mobile", productdescription: "update", productprice: 900))
        Product.pdts.append(Product(productid: 6, productname: "Images", productdescription: "something", productprice: 800))
       Product.pdts.append(Product(productid: 7, productname: "Bottle", productdescription: "super", productprice: 500))
        Product.pdts.append(Product(productid: 8, productname: "Mouse", productdescription: "fifth", productprice: 700))
       Product.pdts.append(Product(productid: 9, productname: "Keyboard", productdescription: "sixth", productprice: 600))
        Product.pdts.append(Product(productid: 10, productname: "Perfume", productdescription: "eight", productprice: 120))
            
            
        }
        
    }
            
       override func viewDidAppear(_ animated: Bool) {
              if pro_duct == nil{
                  pro_duct = Product.pdts.first
                
              }
        
        
     nameTxt.text = pro_duct?.productname
      id.text = "\(pro_duct!.productid)"
    priceTxt.text = "\(pro_duct!.productprice)"
        Desc.text = pro_duct?.productdescription
        
        clearCoreData()
         loadCoreData()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(Savedata), name: UIApplication.willResignActiveNotification, object: nil)
        
        
}
    
   @objc func Savedata(){
        
        clearCoreData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        viewContext = context
        
        for data in Product.pdts {
            
            let list = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
            
            list.setValue(data.productname, forKey: "productname")
                list.setValue(data.productid, forKey: "productid")
                list.setValue(data.productprice, forKey: "productprice")
                list.setValue(data.productdescription, forKey: "productdescription")
            
            do{
                
                try context.save()
            } catch{
                print(error)
            }
            
    }
        
    }
        func loadCoreData() {
            
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
            
            do {
                
                
                let results = try context.fetch(fetchrequest)
                if results is [NSManagedObject]{
                    
                    for r in results as! [NSManagedObject]{
                        
                        let name = r.value(forKey: "productname") as! String
                        let id = r.value(forKey: "productid") as! Int
                        let descr = r.value(forKey: "productdescription") as! String
                        let price = r.value(forKey: "productprice") as! Int
                         
        Product.pdts.append(Product(productid: id, productname: name, productdescription: descr, productprice: price))
                        
                        
                        
                    }
                }
                
                
        } catch{
                print(error)
            }
            
            
            
            
        }
        
        
        func clearCoreData(){
            
            
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
    let context = appDelegate.persistentContainer.viewContext
            
    let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
            
            fetchrequest.returnsObjectsAsFaults = false
            
            do{
                
                
                let result = try context.fetch(fetchrequest)
                
                for data in result{
                    if let objectdata = data as? NSManagedObject{
                        
                        context.delete(objectdata)
                    }
                }
                
                
                
            } catch{
                print(error)
            }
            
            
        }
    
    
    @IBAction func saveData(_ sender: Any) {
        
   let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
  let context = appDelegate.persistentContainer.viewContext

   var  addProduct = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
             
        addProduct.setValue("\(nameTxt.text!)", forKey: "productname")
        addProduct.setValue(Int(id.text!), forKey:"productid")
        addProduct.setValue( "\(Desc.text!)", forKey:"productdescription")
        addProduct.setValue(Int(priceTxt.text!), forKey: "productprice")

               
            do{
                   try context.save()
                   print(addProduct)
               }catch{
                   print(error)
               }
           
        
        
        
        
    }
    
        
    }






