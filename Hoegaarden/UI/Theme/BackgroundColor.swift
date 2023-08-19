//
//  BackgroundColor.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import UIKit

enum BackgroundColor {
    case blueGradient
    case pinkGradient
    case lightGrayGradient
    case lightGrayGradientWithStroke
    
    var backgroundLayer: CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        
        switch self {
        case .blueGradient:
            gradientLayer.colors = [
                UIColor(red: 0.91, green: 0.93, blue: 1.0, alpha: 1.0).cgColor,
                UIColor(red: 0.85, green: 0.89, blue: 0.99, alpha: 1.0).cgColor
            ]
        case .pinkGradient:
            gradientLayer.colors = [
                UIColor(red: 1.0, green: 0.91, blue: 0.91, alpha: 1.0).cgColor,
                UIColor(red: 0.99, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
            ]
        case .lightGrayGradient, .lightGrayGradientWithStroke:
            gradientLayer.colors = [
                UIColor(white: 1.0, alpha: 0.8).cgColor,
                UIColor(white: 1.0, alpha: 0.8).cgColor
            ]
        }
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        return gradientLayer
    }
}
