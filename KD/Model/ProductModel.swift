//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit
// Menu.items
//class Menu {
//    static let menu
//    
//}


// [1 : "a", 2: "b"]
//var menu: [CategoryProduct: [ProductModel]] = [:]
//let nap = menu[.khacahpuri]
struct ProductModel {
    
    let imageProduct: UIImage // картинка
    let priceProduct: Int // цена
    let nameProduct: String // название
    let discriptionProduct: String? //описание товара
    let itLikeChildren: Bool
    let isSpicy: Bool
//    let type: CategoryProduct
    
    //let favoriteProduct: Bool // избранное
    //let measurementProduct: String? // единица измерение продукта
    //let quantityProduct: String? //кол-во
//    let type: CategoryProduct //категория
    
}

enum CategoryProduct {
    case khachapuri // хачапури
    case pizza  // пицца
    case brazier // мангал
    case additionally //дополнительно, к блюду
}



