//
//  CategoryView.swift
//  Hammers
//
//  Created by sergey on 14.10.2022.
//

import UIKit

class CategoryView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var categoryStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CategoryView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        backgroundColor = AppColor.background
        
        layer.shadowOpacity = 0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 14
        layer.shadowOffset = .zero
    }
    
    func addButtons() {
        for category in Category.allCases {
            let button = CategoryButton()
            button.setupLable(title: category.rawValue)
            let index = categoryStackView.arrangedSubviews.endIndex
            categoryStackView.insertArrangedSubview(button, at: index)
        }
    }
    
    func selectButton(button: CategoryButton) {
        guard let buttons = categoryStackView.arrangedSubviews as? [CategoryButton] else { return }
        buttons.forEach {$0.setNormal()}
        button.setSelected()
    }
    
}
