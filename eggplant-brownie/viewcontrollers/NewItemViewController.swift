//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 26/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    var delegate: AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    
    @IBAction  func addNewItem() {
        
        if let name:String = nameField?.text ,
            let calories:Double = Double(caloriesField!.text!) {
            
            if let deleg = delegate{
                let item = Item(name: name, calories: calories)
                deleg.add(item)
            }
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true);
            }
        }
        
    
    }

}
