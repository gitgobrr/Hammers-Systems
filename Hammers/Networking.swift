//
//  Networking.swift
//  Hammers
//
//  Created by sergey on 15.10.2022.
//

import Foundation
import UIKit

class Networking {
    static let url = URL(string: "https://0ddce7ee-4d31-4a39-ab2a-40282e2428e6.mock.pstmn.io/pizzas")!
    
    static func getMenu(_ completion: @escaping ([MenuItem]) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let pizzas = try JSONDecoder().decode([MenuItem].self, from: data)
                completion(pizzas)
            } catch let decodeError {
                print(decodeError)
            }
        }.resume()
    }
    
    static func getImage(url: URL, _ completion: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let image = UIImage(data: data) {
                completion(image)
            }
        }.resume()
    }
}
