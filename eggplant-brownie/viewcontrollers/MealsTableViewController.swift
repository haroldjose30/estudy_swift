//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 23/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController,AddAMealDelegate {
    
    var meals = Array<Meal>()
    
    
    func getArchive() -> String {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let archive = "\(dir)/eggplant-brownie-meals.dados"
        return archive
        
    }
    
    override func viewDidLoad() {
       self.meals = Dao().load()
        
    }
    
    func Add(_ meal:Meal) {
        meals.append(meal)
        Dao().save(meals)
        tableView?.reloadData()
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
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))

        cell.addGestureRecognizer(recognizer)
        
        return cell
    }
    
    
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                RemoveMealController(controller: self).show(meal: meal, handler: { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
    
}
