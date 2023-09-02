//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//
import Foundation

//let product = AppSettings.settings.basket[2]
//let id = product.id

struct ProductModel: Codable {
    
//    let id: UUID
    
    let imageProduct: String
    let priceProduct: Int
    let weight: String
    let nameProduct: String
    let discriptionProduct: String?
    let itLikeChildren: Bool
    let isSpicy: Bool
    let quantity: Int
//    init() {
//        self.id = UUID()
//    }
}

