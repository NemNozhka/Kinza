//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//
import Foundation

struct ProductModel: Codable {
    
    var id = UUID().uuidString
    let imageProduct: String
    let priceProduct: Int
    let weightProduct: String
    let nameProduct: String
    let descriptionProduct: String
    let itLikeChildren: Bool
    let isSpicy: Bool
    
    init(imageProduct: String, priceProduct: Int, weightProduct: String, nameProduct: String, descriptionProduct: String, itLikeChildren: Bool, isSpicy: Bool) {
        self.imageProduct = imageProduct
        self.priceProduct = priceProduct
        self.weightProduct = weightProduct
        self.nameProduct = nameProduct
        self.descriptionProduct = descriptionProduct
        self.itLikeChildren = itLikeChildren
        self.isSpicy = isSpicy
    }
}






