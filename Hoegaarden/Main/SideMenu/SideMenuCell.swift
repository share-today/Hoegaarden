//
//  SideMenuCell.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/16.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    let sideMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "menuOptions"
        label.textColor = .black
        label.font = Font.air.of(size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .white
        selectionStyle = .none
        
        addSubview(sideMenuLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            sideMenuLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sideMenuLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
