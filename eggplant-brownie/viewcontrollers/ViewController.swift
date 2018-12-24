//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 20/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var nameField: UITextField?
    
    @IBOutlet var happinesField: UITextField?
    
    var delegate: AddAMealDelegate?
    
    
    
    var itens = [Item(name: "item 1", calories: 1),
                 Item(name: "item 2", calories: 2),
                 Item(name: "item 3", calories: 3),
                 Item(name: "item 4", calories: 4),
                 Item(name: "item 5", calories: 5),
                 Item(name: "item 6", calories: 6),
                 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    
    @IBAction func add(){
        

        if  let name:String = nameField?.text,
            let happiness:Int = Int(happinesField!.text!){
            
            let meal = Meal(name: name, happiness: happiness)
            
            if let  mealsTableAux = delegate {
               mealsTableAux.Add(meal: meal);
            }
            
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true);
            }
      
        }
    }
}

