//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//
import Foundation
import OrderedCollections 

struct ProductModel: Codable {
    
    var id = UUID().uuidString
    let imageProduct: String
    let priceProduct: Int
    let weight: String
    let nameProduct: String
    let discriptionProduct: String
    let itLikeChildren: Bool
    let isSpicy: Bool
    
    init(imageProduct: String, priceProduct: Int, weight: String, nameProduct: String, discriptionProduct: String, itLikeChildren: Bool, isSpicy: Bool) {
        self.imageProduct = imageProduct
        self.priceProduct = priceProduct
        self.weight = weight
        self.nameProduct = nameProduct
        self.discriptionProduct = discriptionProduct
        self.itLikeChildren = itLikeChildren
        self.isSpicy = isSpicy
    }
}






