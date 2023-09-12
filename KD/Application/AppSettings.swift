//
//  AppSettings.swift
//  KD
//
//  Created by Аркадий Торвальдс on 17.08.2023.
//

import Foundation
import UIKit


class AppSettings {
    static let settings = AppSettings()
    
    var cnahgeBasketClosure: (() -> Void)?
    
    private let basketDataUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("basket.data")
    var sumBasket = Int()
    var bb: [[String:Int]] = []
    var basket: [ProductModel] = [] {
        didSet {
            cnahgeBasketClosure?()
            print("Поработали с массивом, теперь basket count = \(basket.count)")
            for priduct in basket {
                print(priduct.id)
            }
            do {
                let data = try JSONEncoder().encode(basket)
                try data.write(to: basketDataUrl, options: .atomic)
            } catch {
                print("Error while write saved objects: ", error)
            }
        }
    }
    
    func removePruduct(id: String) {
        for var product in basket where product.id == id {
            // удали из массиива
        }
    }
    func addProduct(id: String) {
//        let pr = BasketPruduct(id: id, count: 0)
    }
    
    static let basketKey = "BasketKey"
    
    init() {
        loadBasketFromUserDefaults()
    }
    
    private func loadBasketFromUserDefaults() {
        do {
            let data = try Data(contentsOf: basketDataUrl)
            basket = try JSONDecoder().decode([ProductModel].self, from: data)
        } catch {
            basket = []
        }
    }
    
    var menuID: [String: ProductModel] = [:]
    
}

// http://telegram.org/myCanal?LJKDFFSD:текст запроса


struct BasketPruduct {
    let id: String
    let count: Int
    
    func getCount(id: String) -> Int {
        return 1
    }
}
