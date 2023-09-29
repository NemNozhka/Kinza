//
//  AppSettings.swift
//  KD
//
//  Created by Аркадий Торвальдс on 17.08.2023.
//

import Foundation
import UIKit
import OrderedCollections

class AppSettings {
    static let settings = AppSettings()
    
    
    var cnahgeBasketClosure: (() -> Void)?
    
    private let basketDataUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("basket.data")
    var sumBasket = Int()
    var basket: OrderedDictionary<String, [ProductModel]> = OrderedDictionary() {
        didSet {
            cnahgeBasketClosure?()
            print("Поработали с массивом, теперь basket count = \(basket.count)")
            for product in basket.values.flatMap({ $0 }) {
                print(product.id)
            }
            do {
                let data = try JSONEncoder().encode(basket)
                try data.write(to: basketDataUrl, options: .atomic)
            } catch {
                print("Error while write saved objects: ", error)
            }
        }
    }
    
    func removeItem(id: String) {
        guard let item = Menu.map[id] else { return }
        
        if var existingItems = basket[id] {
            if let index = existingItems.firstIndex(where: { $0.id == item.id }) {
                if existingItems.count > 1 {
                    existingItems.remove(at: index)
                    basket[id] = existingItems
                } else {
                    basket[id] = nil
                }
            }
        }
    }
    
    func addItem(id: String) {
        guard let item = Menu.map[id] else {
            return }
        if var existingItems = basket[id] {
            existingItems.append(item)
            basket[id] = existingItems
        } else {
            basket[id] = [item]
        }
    }
    
    static let basketKey = "BasketKey"
    
    init() {
        loadBasketFromUserDefaults()
    }
    
    private func loadBasketFromUserDefaults() {
        do {
            let data = try Data(contentsOf: basketDataUrl)
            basket = try JSONDecoder().decode(OrderedDictionary<String, [ProductModel]>.self, from: data)
        } catch {
            basket = [:]
        }
    }
}



// http://telegram.org/myCanal?LJKDFFSD:текст запроса


