//
//  ListViewController.swift
//  DelegateExample
//
//  Created by David Chen on 2019/6/30.
//  Copyright © 2019 pqteru. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var items: [String] = ["grocery 1", "grocery 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddFoodViewController
        vc?.delegate = self
    }

}

// in the same file, implement delegate method here
extension ListViewController: AddFoodViewControllerDelegate {
    func addIngredient(array: [String]) {
        items += array
        self.tableView.reloadData()
    }
}
