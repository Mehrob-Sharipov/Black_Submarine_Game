//
//  SettingsViewController.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 25.06.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var submarineImageView: UIImageView!
    
    @IBOutlet weak var hardLavelSlider: UISlider!
    @IBOutlet weak var hindranceImageView: UIImageView!
    @IBOutlet weak var randomHindranceSwicher: UISwitch!
    
    
    @IBOutlet weak var playerSettingsLable: UILabel!
    @IBOutlet weak var playerSettingBackLable: UIButton!
    @IBOutlet weak var playerSettingNextLable: UIButton!
    
    @IBOutlet weak var gameSettingsLable: UILabel!
    @IBOutlet weak var lightGameSettingsLable: UILabel!
    @IBOutlet weak var hardGameSettingsLable: UILabel!
    
    @IBOutlet weak var backGameSettingsLable: UIButton!
    @IBOutlet weak var nextGameSettingsLable: UIButton!
    @IBOutlet weak var RandomhindranceLable: UILabel!

    
    
    
    
    var settingsModel = SettingsModel.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(settingsModel.submarineName)
        playerTextField.delegate = self
        
        hardLavelSlider.maximumValue = 3
        hardLavelSlider.minimumValue = 0
        
        loadSettings()
        setSettings()
        setlocalized()
    }
    
    
    
    func setlocalized(){
        playerSettingsLable.text = "Player settings".localized()
        gameSettingsLable.text = "Game settings".localized()
        lightGameSettingsLable.text = "Light".localized()
        hardGameSettingsLable.text = "Hard".localized()
        RandomhindranceLable.text = "Random hindrance".localized()
 
        playerSettingBackLable.titleLabel?.text = "Back".localized()
        playerSettingNextLable.titleLabel?.text = "Next".localized()
        backGameSettingsLable.titleLabel?.text = "Back".localized()
        nextGameSettingsLable.titleLabel?.text = "Next".localized()
    }
    
 
    
    func loadSettings(){
        if let settings = UserDefaults.standard.value(SettingsModel.self, forKey: "set") {
            self.settingsModel = settings
            UserDefaults.standard.removeObject(forKey: "set")

            print(settingsModel.submarineName)
        }
    }
    
    

    func setSettings(){
        playerTextField.text = settingsModel.player
        submarineImageView.image = UIImage(named: settingsModel.submarineName)
        hardLavelSlider.value = settingsModel.hardLavel
        hindranceImageView.image = UIImage(named: settingsModel.hindranceName)
        randomHindranceSwicher.isOn = settingsModel.randomHindrance
    }

    
    

    
    //Game settings
    
    @IBAction func gameSliderAction(_ sender: Any) {
        settingsModel.hardLavel = hardLavelSlider.value
    }
    
    @IBAction func nextHindranceButtonPressed(_ sender: Any) {
        let hindrance = NameDataBase.shared.hindranceImageName(.next)
        SettingsModel.shared.hindranceName = hindrance
        hindranceImageView.image = UIImage(named: hindrance)
    }
    
    @IBAction func backHindranceButtonPressed(_ sender: Any) {
        let hindrance = NameDataBase.shared.hindranceImageName(.back)
        SettingsModel.shared.hindranceName = hindrance
        hindranceImageView.image = UIImage(named: hindrance)
    }
    
    @IBAction func swicherAction(_ sender: Any) {
        settingsModel.randomHindrance = randomHindranceSwicher.isOn
    }
    
    
    
    //Player settings

    @IBAction func backSubmarineButtonPressed(_ sender: Any) {
        let submarine = NameDataBase.shared.submarineImageName(.back)
        SettingsModel.shared.submarineName = submarine
        submarineImageView.image = UIImage(named: submarine)
    }
    
    
    @IBAction func nextSubmarineButtonPressed(_ sender: Any) {
        let submarine = NameDataBase.shared.submarineImageName(.next)
        SettingsModel.shared.submarineName = submarine
        submarineImageView.image = UIImage(named: submarine)
    }
    
    

    @IBAction func backButtonPressed(_ sender: Any) {

        //settings.player = playerTextField.text ?? "Player 1"
        
        UserDefaults.standard.set(encodable: self.settingsModel, forKey: "set")
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
}





//extension UITextField

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerTextField.resignFirstResponder()
        return true
    }
}
