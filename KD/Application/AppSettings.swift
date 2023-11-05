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
    var basket: OrderedDictionary<String, ProductModel> = OrderedDictionary() {
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
    
    func removeAll() {
            basket.removeAll()
        NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
        }
    
    func removeSingleItem(id: String) {
        if var existingProduct = basket[id] {
            print("Продукт с ID \(id) найден в корзине.")
            basket.removeValue(forKey: id)
        }
        NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
    }
    
    func removeItem(id: String) {
            if var existingProduct = basket[id] {
                print("Продукт с ID \(id) найден в корзине.")
                
                if let originalProduct = Menu.map[id] {
                    if existingProduct.isWeightProduct {
                        if existingProduct.weightProduct - 0.1 >= originalProduct.weightProduct {
                            existingProduct.weightProduct -= 0.1
                            print("Товар весовой. Уменьшаем вес продукта на 0.1. Текущий вес: \(existingProduct.weightProduct)")
                            basket[id] = existingProduct
                        } else {
                            print("Товар весовой. Удаляем продукт из корзины, так как его вес стал меньше изначального веса.")
                            basket.removeValue(forKey: id)
                        }
                    } else {
                        if existingProduct.quantityProduct - 1 >= originalProduct.quantityProduct {
                            existingProduct.quantityProduct -= 1
                            print("Товар не весовой. Уменьшаем количество на 1. Текущее количество: \(existingProduct.quantityProduct)")
                            basket[id] = existingProduct
                        } else {
                            print("Товар не весовой. Удаляем продукт из корзины, так как его количество стало меньше изначального количества.")
                            basket.removeValue(forKey: id)
                        }
                    }
                    
                    NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
                    print("Отправляем уведомление о том, что корзина была изменена.")
                } else {
                    print("Ошибка: Продукт с ID \(id) не найден в меню.")
                }
            } else {
                print("Продукт с ID \(id) не найден в корзине.")
            }
        }
    
    func addItem(id: String) {
            if let product = Menu.map[id] {  // Исправлено здесь: Menu.menu.map на Menu.map
                print("Продукт с ID \(id) найден в меню.")
                
                if var existingProduct = basket[id] {  // Используем var вместо let
                    print("Продукт с ID \(id) уже в корзине.")
                    
                    if product.isWeightProduct {
                        existingProduct.weightProduct += 0.1
                        print("Товар весовой. Увеличиваем вес продукта на 0.1. Текущий вес: \(existingProduct.weightProduct)")
                    } else {
                        existingProduct.quantityProduct += 1
                        print("Товар не весовой. Увеличиваем количество на 1. Текущее количество: \(existingProduct.quantityProduct)")
                    }
                    
                    basket[id] = existingProduct
                    print("Обновляем продукт в корзине.")
                } else {
                    basket[id] = product
                    print("Продукта с ID \(id) нет в корзине. Добавляем продукт в корзину.")
                }
                
                NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
                print("Отправляем уведомление о том, что корзина была изменена.")
            } else {
                print("Продукт с ID \(id) не найден.")
            }
        }
    
    func calculateTotalPrice() -> Int {
            var total = 0
            for (_, product) in basket {
                let pricePerUnit = product.priceProduct
                if product.isWeightProduct {
                    total += Int(Double(pricePerUnit) * (product.weightProduct/0.1))
                } else {
                    total += pricePerUnit * product.quantityProduct
                }
            }
            return total
        }
    
    static let priceDelivery = 100
    static let minimalPriceDelivery = 800
    
    func isDeliveryFree() -> Bool {
        return calculateTotalPrice() >= AppSettings.minimalPriceDelivery
        }
    
    static let basketKey = "BasketKey"
    
    init() {
        loadBasketFromUserDefaults()
    }
    
    private func loadBasketFromUserDefaults() {
        do {
            let data = try Data(contentsOf: basketDataUrl)
            basket = try JSONDecoder().decode(OrderedDictionary<String, ProductModel>.self, from: data)
            
        } catch {
            print("Ошибка при загрузке корзины: \(error)")
            basket = [:]
        }
    }
}






