//
//  TableViewCell.swift
//  Hammers
//
//  Created by sergey on 14.10.2022.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func updateCellIMage(image: UIImage)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceButton: PriceButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    lazy var presenter = TableViewCellPresenter(delegate: self)
}

extension TableViewCell: TableViewCellDelegate {
    func updateCellIMage(image: UIImage) {
        self.itemImage.image = image
    }
}

