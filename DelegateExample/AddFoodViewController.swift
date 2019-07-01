//
//  AddFoodViewController.swift
//  DelegateExample
//
//  Created by David Chen on 2019/6/30.
//  Copyright © 2019 pqteru. All rights reserved.
//

import UIKit

// AddFoodViewController.swift
protocol AddFoodViewControllerDelegate {
    func addIngredient(array: [String])
}

class AddFoodViewController: UITableViewController {

    var delegate: AddFoodViewControllerDelegate?
    
    //array of food
    let array = ["1 Salad", "3oz Chicken", "2 Tomatoes", "2 Cucumbers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let barBtn = UIBarButtonItem(title: "Add to List", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addToList(sender:)))
        self.navigationItem.rightBarButtonItem = barBtn
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    @objc func addToList(sender: Any) {
        delegate?.addIngredient(array: array)
    }
    
}
