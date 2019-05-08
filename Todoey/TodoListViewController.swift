//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Peter Bassem on 5/7/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [String] = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }

    // MARK - Tableview Datasource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo_item_cell = tableView.dequeueReusableCell(withIdentifier: "todo_item_cell", for: indexPath)
        let item = itemArray[indexPath.row]
        todo_item_cell.textLabel?.text = item
        return todo_item_cell
    }
    
    // MARK - Tableview Degeate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
//        print(item)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: nil, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add Item", style: UIAlertAction.Style.default) { (action) in
            self.itemArray.append(textField.text ?? "New Item")
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

