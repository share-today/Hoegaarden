//
//  Typography.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/17.
//

import UIKit

enum Font: String {
    case bold = "Cafe24Ssurround"
    case air = "Cafe24SsurroundAir"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

struct Typography {
    static func createLabel(font: Font, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: font.rawValue, size: fontSize)
        return label
    }
    
    static let h1: UILabel = {
        let label = createLabel(font: .bold, fontSize: 40)
        return label
    }()
    
    static let h2: UILabel = {
        let label = createLabel(font: .bold, fontSize: 32)
        return label
    }()
    
    static let h3: UILabel = {
        let label = createLabel(font: .bold, fontSize: 30)
        return label
    }()
    
    static let h4: UILabel = {
        let label = createLabel(font: .bold, fontSize: 24)
        return label
    }()
    
    static let subtitle1: UILabel = {
        let label = createLabel(font: .bold, fontSize: 20)
        return label
    }()
    
    static let subtitle2: UILabel = {
        let label = createLabel(font: .bold, fontSize: 16)
        return label
    }()
    
    static let body1: UILabel = {
        let label = createLabel(font: .air, fontSize: 20)
        return label
    }()
    
    static let body2: UILabel = {
        let label = createLabel(font: .air, fontSize: 16)
        return label
    }()
    
    static let boldSmall: UILabel = {
        let label = createLabel(font: .bold, fontSize: 14)
        return label
    }()
    
    static let smallText: UILabel = {
        let label = createLabel(font: .air, fontSize: 14)
        return label
    }()
    
    static let preText: UILabel = {
        let label = createLabel(font: .air, fontSize: 12)
        return label
    }()
}
