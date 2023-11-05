//
//  MenuManager.swift
//  KD
//
//  Created by Сергей Ножка on 03.11.2023.
//

import Foundation

/// Управляет загрузкой и хранением данных о меню в приложении.
class MenuManager {
    
    /// Singleton экземпляр для доступа к менеджеру меню.
    static let shared = MenuManager()

    /// Экземпляр загрузчика данных меню.
    private let menuLoader = MenuLoader()
    
    /// Массив категорий продуктов, каждая категория содержит массив продуктов.
    /// Использование private(set) позволяет сделать массив доступным для чтения извне, но изменять его можно только внутри класса.
    private(set) var menu: [[ProductModel]] = [[], [], [], []]
    
    /// Словарь для быстрого доступа к продуктам по их идентификатору.
    /// Ключ - идентификатор продукта, значение - сам продукт.
    private(set) var map: [String: ProductModel] = [:]

    /// Приватный инициализатор для реализации Singleton паттерна.
    private init() {}

    /// Загружает меню, обращаясь к каждой категории продуктов.
    func loadMenu(completion: @escaping (_ categoryIndex: Int?) -> Void) {
        print("Loading menu...")
        let collectionNames = ["Pizza", "Brazier", "Khachapuri", "To the dish"]

        for (index, collectionName) in collectionNames.enumerated() {
            // Загружаем коллекцию продуктов.
            menuLoader.loadCollection(collectionName) { [weak self] products, error in
                defer {
                    // Вызываем completion handler для обновления UI для текущей категории.
                    DispatchQueue.main.async {
                        completion(index)
                    }
                }

                guard let products = products, error == nil else {
                    print("Error loading collection \(collectionName): \(String(describing: error))")
                    return
                }

                let imageGroup = DispatchGroup()
                var tempProducts = products

                for (i, product) in products.enumerated() {
                    guard let imageURL = product.imageProduct else { continue }
                    imageGroup.enter()
                    self?.menuLoader.loadImageForProduct(url: imageURL) { url, error in
                        tempProducts[i].imageProduct = url ?? ""
                        imageGroup.leave()
                    }
                }

                imageGroup.notify(queue: .main) {
                    self?.menu[index] = tempProducts
                    for product in tempProducts {
                        self?.map[product.id ?? UUID().uuidString] = product
                    }
                    // Теперь не нужно, так как UI обновляется выше в defer блоке.
                    // completion(index)
                }
            }
        }
    }
}
