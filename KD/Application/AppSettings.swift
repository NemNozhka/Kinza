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
                print(product.idProduct)
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
        guard basket.keys.contains(id), let existingItems = basket[id] else { return }

            if existingItems.count > 1 {
                basket[id] = Array(existingItems.dropLast())
            } else {
                basket[id] = nil
            }
        NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
    }
    
    func addItem(id: String) {
        guard let newItem = Menu.map[id] else { return }
           
           if let existingItems = basket[id] {
               basket[id] = existingItems + [newItem]
           } else {
               basket[id] = [newItem]
           }
        NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
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
            print("Ошибка при загрузке корзины: \(error)")
            basket = [:]
        }
    }
}



// http://telegram.org/myCanal?LJKDFFSD:текст запроса


