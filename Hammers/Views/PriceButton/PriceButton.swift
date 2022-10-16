//
//  PriceButton.swift
//  Hammers
//
//  Created by sergey on 16.10.2022.
//

import UIKit

class PriceButton: UIButton {
    
    override func didMoveToSuperview() {
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = AppColor.accent.cgColor
        tintColor = AppColor.accent
        backgroundColor = .clear
        
        heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
