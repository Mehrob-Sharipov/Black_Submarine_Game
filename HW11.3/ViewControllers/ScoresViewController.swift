//
//  ScoresViewController.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 25.06.2023.
//

import UIKit

class ScoresViewController: UIViewController {
    
    let scoreTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScoreTableView()
    }
    
    func setScoreTableView(){
        scoreTableView.register(ScoresTableViewCell.self, forCellReuseIdentifier: "cell")
        scoreTableView.dataSource = self
        scoreTableView.delegate = self
        view.addSubview(scoreTableView)
        
        scoreTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            scoreTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 64),
            scoreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            scoreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}





//extension
extension ScoresViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        if section == 0 {
            count = 1
        } else if section == 1 {
            count = ScoresManager.shared.scoresCount()
            
        }
        
        
        return count
        //ScoresManager.shared.scoresCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
                ScoresTableViewCell else {return UITableViewCell()}
        
        cell.setConfig(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let result =  "Results"
        if section == 0 {
            return result
        }
        return ""
    }
    
    
}
