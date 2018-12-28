//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Harold Jose Barros Gonçalves on 28/12/18.
//  Copyright © 2018 Rsac. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        let details = UIAlertController(title: meal.name,
                                        message: meal.details(),
                                        preferredStyle: UIAlertController.Style.alert)
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertAction.Style.cancel,
                                   handler: nil)
        details.addAction(cancel)
        
        
        let remove = UIAlertAction(title: "Remove",
                                   style: UIAlertAction.Style.destructive,
                                    handler: handler)
        
        details.addAction(remove)
        
        controller.present(details, animated: true, completion: nil)
    }
}
