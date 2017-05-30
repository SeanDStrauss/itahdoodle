//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Sean Strauss on 5/29/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()


    override func viewDidLoad() {
        super.viewDidLoad()
        todoList.registerTableView(tableView, todoList: todoList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let todo = itemTextField.text else {
            return
        }
        todoList.add(todo)
        itemTextField.text = ""
        tableView.reloadData()
    }

}

