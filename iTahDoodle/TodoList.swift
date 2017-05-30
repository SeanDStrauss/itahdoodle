//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Sean Strauss on 5/29/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    
    private let fileUrl: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }

    
    func saveItems()  {
        let itemsArray = items as NSArray
        print("saving items to \(fileUrl)")
        if !itemsArray.write(to: fileUrl, atomically: true) {
            print("could not save list")
        }
    }
    
    func loadItems()  {
        if let itemsArray = NSArray(contentsOf: fileUrl) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String)  {
        items.append(item)
        saveItems()
    }
    
    func registerTableView(_ tableView: UITableView, todoList: TodoList)  {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }
    
    
}

extension TodoList: UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }

}




