//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//
import Foundation


struct ProductModel: Codable {
    
    let imageProduct: String
    let priceProduct: Int
    let weight: String
    let nameProduct: String
    let discriptionProduct: String?
    let itLikeChildren: Bool
    let isSpicy: Bool
    var quantityInBasket: Int
    var isInBasket: Bool
}






