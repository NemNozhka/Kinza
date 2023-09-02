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
    
    private let basketDataUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("basket.data")
    var basket: [ProductModel] = [] {
        didSet {
            print(basket.count)
            do {
                let data = try JSONEncoder().encode(basket)
                try data.write(to: basketDataUrl, options: .atomic)
            } catch {
                print("Error while write saved objects: ", error)
            }
        }
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
}

// http://telegram.org/myCanal?LJKDFFSD:текст запроса
