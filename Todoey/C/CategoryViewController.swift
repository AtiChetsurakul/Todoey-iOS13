//
//  CategoryViewController.swift
//  Todoey
//
//  Created by ati chetsurakul on 5/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreData
class CategoryViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
    
    var categoryArray:[CateGoryX] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItem()
    }

    
    @IBAction func AddCategoryPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) {action in
            let newCategory = CateGoryX(context: self.context)
            newCategory.name = textfield.text!
            self.categoryArray.append(newCategory)
            self.saveItem()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "?"
            textfield = alertTextField
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    //MARK: tablevierw datasource method
    
    
    
    
    
    //MARK: data manipulation
    
    
    
    
    //MARK: tableview delegate method

    func saveItem() {
  
        do {
            try context.save()
        }catch {
           print("error saving context\(error)")
        }
        self.tableView.reloadData()
    }


    func loadItem(with request:NSFetchRequest<CateGoryX> = CateGoryX.fetchRequest()) {
    
        do
        {
          categoryArray = try context.fetch(request)
        }
        catch {
            print("fetct error\(error)")
        }
    }
}
    




extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CategoryXCell", for: indexPath)
        let cateG = categoryArray[indexPath.row]
        cell.textLabel?.text = cateG.name
        
        return cell
    }
    
    
    
    
}








    

/* From ViewDidLoad

// Uncomment the following line to preserve selection between presentations
// self.clearsSelectionOnViewWillAppear = false

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem
 
 */



    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


