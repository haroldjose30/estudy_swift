//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 20/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var happinesField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func add(){
        let name = nameField.text
        let happiness = happinesField.text
        print("eaten \(name) with happiness \(happiness)!")
        

    }
    
    
    
  


}

