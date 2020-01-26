//
//  ProductTableViewController.swift
//  IOSFinalAssignment
//
//  Created by Amanpreet Kaur on 2020-01-24.
//  Copyright © 2020 Amanpreet Kaur. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController,UISearchResultsUpdating {
    
    
    
    var context: NSManagedObjectContext?
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var search: UISearchBar!
    var r : [NSManagedObject]?
    var pro: Product?
    var filterProduct = [Product]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
        
    
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

       
        
        
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        let search = searchController.searchBar
         filterProduct(search.text!)
        
}
    func filterProduct(_ searchText: String) {
        filterProduct = Product.pdts.filter({ (pro: Product) -> Bool in
            return pro.productname.uppercased().contains(searchText.uppercased())
        })
        tableView.reloadData()
    }
    
   
       
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
         
                    return Product.pdts.count ?? 0
                    
                }
        //        return productsData.count ?? 0
    
    
    func g_Product()-> Product{
              
           return pro!
          }
            

        
        
       
        
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell  = tableView.dequeueReusableCell(withIdentifier: "producttable",for: indexPath)
        let pro =  Product.pdts[indexPath.row]
       
        
        cell.textLabel?.text = pro.productname
        cell.detailTextLabel?.text = "\(pro.productprice)"
         return cell
         
    
//
//        cell.textLabel?.text = Product.pdts[indexPath.row].productname
//        return cell// Configure the cell...

        // Configure the cell...

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pro = Product.pdts[indexPath.row]
    }
   
           
    
    
    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    
    override func viewDidAppear(_ animated: Bool) {
           tableView.reloadData()
       }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if var vc = segue.destination as? ViewController {
            
                        vc.delegate = self
        
        
        
    }
    


}

}
