//
//  ViewController+Extension.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 26.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func showAlert(title: String ,message: String , style: UIAlertController.Style, handler: @escaping () -> ()){
    
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            handler()
        }
        
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    
    
}
