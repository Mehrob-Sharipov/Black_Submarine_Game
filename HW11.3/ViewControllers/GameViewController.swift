//
//  SecondViewController.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 16.06.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var gameBoardView: UIView!
    
    var moveTimer = Timer()
    var createTimer = Timer()
    var settings = SettingsModel.shared
    
    
    let yellowShipView = UIView(frame: .init(x: 40, y: 0, width: 150, height: 25))
    var viewArray: [UIView] = []
    var scores = 0
    
    
    var isStopTimer:Bool = false {
        didSet {
            if isStopTimer {
                moveTimer.invalidate()
                createTimer.invalidate()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setYellowShip()
        moveView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
        
    }
    
    
    func loadSettings(){
        guard let settings = UserDefaults.standard.value(SettingsModel.self, forKey: "settings") else {return}
        self.settings = settings
    }
    
    
    func currentDate() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "dd MMMM yyyy hh:mm"
        return formater.string(from: Date())
    }
    
    
    
    func createView(width: CGFloat, height: CGFloat) -> UIView {
        let xFrame = gameBoardView.frame.width + height
        let yFrame = CGFloat.random(in: height...(gameBoardView.frame.height - height))
        
        let randomImageName = NameDataBase.shared.hindranceImageName(.random)
        let hindranceImageName = settings.hindranceName
        
        let imageName = settings.randomHindrance ? randomImageName : hindranceImageName
        
        let image = UIImage(named: imageName)
        
        let view = UIView()
        view.frame = .init(x: xFrame, y: yFrame, width: width, height: height)
        //view.backgroundColor = .black
        let imageView = UIImageView(image: image)
        imageView.frame = .init(x: 0, y: 0, width: width, height: height)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        return view
    }
    
    
    
    
    func moveView(){
        createTimer = Timer.scheduledTimer(withTimeInterval: 1 / TimeInterval(settings.hardLavel) , repeats: true) { _ in
            let createView = self.createView(width: 50, height: 40)
            self.viewArray.append(createView)
            self.gameBoardView.addSubview(createView)
        }
        
        
        moveTimer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { _ in
            self.scores += 1
            for view in self.viewArray {
                if self.yellowShipView.frame.intersects(view.frame) {
                    self.isStopTimer = true
                    self.showAlert(title: "You lose", message: "\(self.currentDate()), scores is \(self.scores)", style: .alert) {
                        ScoresManager.shared.addResult(score: .init(player: "player", scores: self.scores, date: self.currentDate()))
                        self.navigationController?.popViewController(animated: true)
                        self.isStopTimer = true
                    }
                }
                
                if view.frame.origin.x <= -view.frame.width {
                    UIView.animate(withDuration: 1) {
                        view.removeFromSuperview()
                    }
                } else {
                    UIView.animate(withDuration: 0.5) {
                        view.frame.origin.x -= 10
                    }
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    func setYellowShip(){
        let image = UIImage(named: settings.submarineName)
        let imageView = UIImageView(image: image)
        imageView.frame = .init(x: 0, y: -10, width: 145, height: 40)
        imageView.contentMode = .scaleAspectFill
        yellowShipView.addSubview(imageView)
        gameBoardView.addSubview(yellowShipView)
    }
    
    func moveShip(action:ShipActions){
        let yShipFrame = yellowShipView.frame.origin.y
        let maxYBoardFrame = gameBoardView.frame.height - yellowShipView.frame.height - 10
        
        switch action {
        case .Up:
            if yShipFrame > 5  {
                UIView.animate(withDuration: 0.5) {
                    self.yellowShipView.frame.origin.y -= 15
                }
            }
        case .Dawn:
            if yShipFrame < maxYBoardFrame {
                UIView.animate(withDuration: 0.5) {
                    self.yellowShipView.frame.origin.y += 15
                }
            }
        }
    }
    
    
    
    
    @IBAction func quitButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        isStopTimer = true
    }
    
    
    @IBAction func upButtonPressed(_ sender: Any) {
        moveShip(action: .Up)
    }
    
    @IBAction func downButtonPressed(_ sender: Any) {
        moveShip(action: .Dawn)
    }
    
    
    
    
}


