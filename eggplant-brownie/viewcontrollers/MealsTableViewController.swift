//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 23/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController,AddAMealDelegate {
    
    var meals = [Meal(name: "refeicao 1", happiness: 5),
                 Meal(name: "refeicao 2", happiness: 3)]
    
    func Add(meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal"){
            let view:ViewController = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        return cell
    }
    
}
