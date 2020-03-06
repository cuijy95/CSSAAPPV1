//
//  HandBookController.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-05.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class HandBookViewController: UITableViewController {
    
    let catalogCell = "catalogCells"
    var handbooks = [HandBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "新生手册"
        
        handbooks.append(HandBook(catalog: "目录1"))
        handbooks.append(HandBook(catalog: "目录2"))
        handbooks.append(HandBook(catalog: "目录3"))
        handbooks.append(HandBook(catalog: "目录4"))
        handbooks.append(HandBook(catalog: "目录5"))
        handbooks.append(HandBook(catalog: "目录6"))
        handbooks.append(HandBook(catalog: "目录7"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: catalogCell)
        let catalog = handbooks[indexPath.row]
        cell.textLabel?.text = catalog.getCatalog()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentController = HandBookContentViewController()
        self.navigationController?.pushViewController(contentController, animated: false)
    }
    
}
