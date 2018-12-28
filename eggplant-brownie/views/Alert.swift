//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 28/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller:UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(title:String="Sorry", message:String="Unexpected error.") {
        
     
        
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle:
            UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
