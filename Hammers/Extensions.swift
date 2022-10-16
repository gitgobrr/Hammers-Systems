
import Foundation
import UIKit

extension UIView {
    func makeRound() {
        layer.cornerRadius = bounds.height/2
        clipsToBounds = true
    }
    
    func addTopCornerRadius(_ r: CGFloat = 16) {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = r
    }
}
