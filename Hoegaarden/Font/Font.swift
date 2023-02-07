//
//  Font.swift
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
