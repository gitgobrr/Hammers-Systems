//
//  CategoryButton.swift
//  Hammers
//
//  Created by sergey on 14.10.2022.
//

import UIKit

class CategoryButton: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        contentView.makeRound()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CategoryButton", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        setupUI()
    }
    
    func setupUI() {
        contentView.layer.cornerRadius = frame.size.height/2
        contentView.layer.masksToBounds = true
        label.textColor = AppColor.accentTransparent
        contentView.backgroundColor = .clear
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = AppColor.accentTransparent.cgColor
        
        contentView.widthAnchor.constraint(equalToConstant: 82).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
    func setupLable(title: String) {
        label.text = title
    }
    
    func setSelected() {
        label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: .semibold)
        contentView.backgroundColor = AppColor.accentTransparent
        label.textColor = .red
        contentView.layer.borderWidth = 0
    }
    
    func setNormal() {
        label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: .regular)
        label.textColor = AppColor.accentTransparent
        contentView.backgroundColor = .clear
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = AppColor.accentTransparent.cgColor
    }
    
}
