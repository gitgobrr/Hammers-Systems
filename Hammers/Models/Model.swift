

import Foundation

struct MenuItem: Decodable {
    let name: String
    let description: String
    let price: String
    let image: URL
    let category: Category
}

enum Category: String, CaseIterable, Decodable {
    case pizza, combo , drink , desert, other
}
