//
//  ScoresTableViewCell.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 13.07.2023.
//

import UIKit

class ScoresTableViewCell: UITableViewCell {

      var player = UILabel()
      var score = UILabel()
      var date = UILabel()

   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player.text = nil
        contentView.backgroundColor = .clear
    }
    
    func setTableViewCell(){
        [player, score, date].forEach {
            contentView.addSubview($0)
            $0.textAlignment = .center
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            player.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            player.widthAnchor.constraint(equalTo: score.widthAnchor),
            
            score.topAnchor.constraint(equalTo: player.topAnchor),
            score.leadingAnchor.constraint(equalTo: player.trailingAnchor, constant: -16),
            score.widthAnchor.constraint(equalTo: date.widthAnchor),

            date.topAnchor.constraint(equalTo: player.topAnchor),
            date.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: -16),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func setConfig(indexPath: IndexPath){

        if indexPath.section == 0 {
            self.player.text = "Name"
            self.score.text = "Scores"
            self.date.text = "Time"
            
        }else {
            let result = ScoresManager.shared.result(byIndexPath: indexPath)
            self.player.text = result.player
            self.score.text = String(describing: result.scores)
            self.date.text = result.date
        }
        
 
        
    }
    
    
}
