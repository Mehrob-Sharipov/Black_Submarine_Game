//
//  ViewController.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 15.06.2023.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var gameLable: UILabel!
    @IBOutlet weak var startGameLable: UIButton!
    @IBOutlet weak var scoresLable: UIButton!
    @IBOutlet weak var setingsLable: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gameLable.text = "Black Submarine".localized()
        startGameLable.titleLabel?.text = "Start Game".localized()
        scoresLable.titleLabel?.text = "Scores".localized()
        
        
//         setingsLable.setTitle("Settings".localized(), for: .normal)
//         setingsLable.titleLabel?.font = .init(name: "Arial", size: 25)
//
//    
//        
        
        
        let string =  "Settings".localized()
        
        let attrinbutes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.backgroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 33),
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let strAttributed = NSMutableAttributedString(string: string, attributes: attrinbutes)
        
    
        setingsLable.titleLabel?.attributedText = strAttributed

        //setingsLable.titleLabel?.text = "Settings".localized()
    }
    
    
    
    
    
}

