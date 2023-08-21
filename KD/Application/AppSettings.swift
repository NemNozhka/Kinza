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
    
    var basket: [MenuItemType] = [] {
        didSet {
            // записываем куда либо
            print(basket.count)
        }
    }
}

// http://telegram.org/myCanal?LJKDFFSD:текст запроса
