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
    
    private var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = .white
        selectionStyle = .none
        
        addSubview(indicatorView)
        indicatorView.addSubview(sideMenuLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            sideMenuLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            sideMenuLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sideMenuLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setSideIndicatorColor() {
        indicatorView.backgroundColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
    }
    
    func setHomeIndicator() {
        setSideIndicatorColor()
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: sideMenuLabel.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: sideMenuLabel.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 72),
            indicatorView.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func setBundleIndicator() {
        setSideIndicatorColor()
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: sideMenuLabel.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: sideMenuLabel.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 100),
            indicatorView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setSettingIndicator() {
        setSideIndicatorColor()
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: sideMenuLabel.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: sideMenuLabel.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 72),
            indicatorView.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
