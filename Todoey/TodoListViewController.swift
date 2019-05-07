//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Peter Bassem on 5/7/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray: [String] = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
}

