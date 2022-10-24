//
//  Extension + UIAlertController.swift
//  Avito Trainee
//
//  Created by packovv on 24.10.2022.
//

import UIKit

extension UIAlertController {
    
    static func createAlertController(withMessage message: String) -> UIAlertController {
        let messageText = message + " See more in Console."
        return UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
    }
    
    func action() {
        let okAction = UIAlertAction(title: "Ok", style: .default)
        addAction(okAction)
    }
}
