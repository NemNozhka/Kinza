//
//  BasketBadgeValue.swift
//  KD
//
//  Created by Сергей Ножка on 04.09.2023.
//

import Foundation
import UIKit

class BasketBadgeValue: UITabBarItem {
    
    badgeValue = "\(AppSettings.settings.basket.count)"
    AppSettings.settings.addBadgeValueClosure = { [weak self] _ in
        guard let self = self else { return }
    }
    
}
