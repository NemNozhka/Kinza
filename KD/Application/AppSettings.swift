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
    
    var basket: [ProductModel] = [] {
        didSet {
            print(basket.count)
            saveBasketToUserDefaults()
        }
    }
    
    static let basketKey = "BasketKey"
    
    private init() {
        loadBasketFromUserDefaults()
    }
    
    private func saveBasketToUserDefaults() {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: basket, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: AppSettings.basketKey)
        } catch {
            print("Ошибка при кодировании basket: \(error.localizedDescription)")
        }
    }
    
    private func loadBasketFromUserDefaults() {
        if let encodedData = UserDefaults.standard.object(forKey: AppSettings.basketKey) as? Data {
            do {
                if let decodedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData) as? [ProductModel] {
                    basket = decodedData
                }
            } catch {
                print("Ошибка при декодировании basket: \(error.localizedDescription)")
            }
        }
    }
}

// http://telegram.org/myCanal?LJKDFFSD:текст запроса
