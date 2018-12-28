//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 20/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    
    @IBOutlet var nameField: UITextField?
    
    @IBOutlet var happinesField: UITextField?
    
    var delegate: AddAMealDelegate?
    
    var selected = Array<Item>()
    
    var itens = [Item(name: "item 1", calories: 1),
                 Item(name: "item 2", calories: 2),
                 Item(name: "item 3", calories: 3),
                 Item(name: "item 4", calories: 4),
                 Item(name: "item 5", calories: 5),
                 Item(name: "item 6", calories: 6),
                 ]
    
     func getArchive()->String {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let archive = "\(dir)/eggplant-brownie-items.dados"
        return archive
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton;
        
        itens = Dao().load()
    }
    
    @IBOutlet var tableView: UITableView?
    
    func add(_ item: Item) {
        itens.append(item)
        Dao().save(itens)
        tableView?.reloadData()
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = itens[indexPath.row]
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = itens[indexPath.row]
                if let position = selected.index(of: item) {
                    selected.remove(at: position)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = itens[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func convertToInt(_ text: String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        
        if let name = nameField?.text {
            if let happiness = convertToInt(happinesField?.text) {
                return Meal(name: name, happiness: happiness, itens: selected)
            }
        }
        return nil
        
    }
    
    @IBAction func add(){
        

        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.Add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        
        Alert(controller: self).show()

        
    }
}

