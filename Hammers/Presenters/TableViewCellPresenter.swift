//
//  TableViewCellPresenter.swift
//  Hammers
//
//  Created by sergey on 16.10.2022.
//

import Foundation

class TableViewCellPresenter {
    weak private var delegate: TableViewCellDelegate?
    
    init(delegate: TableViewCellDelegate) {
        self.delegate = delegate
    }
    
    func loadImage(url: URL) {
        Networking.getImage(url: url) { image in
            DispatchQueue.main.async {
                self.delegate?.updateCellIMage(image: image)
            }
        }
    }
    
}
