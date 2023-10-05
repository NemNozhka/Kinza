//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//
import Foundation

struct ProductModel: Codable {
    
    let idProduct: String
    let imageProduct: String
    let priceProduct: Int
    let weightProduct: Double
    let nameProduct: String
    let descriptionProduct: String
    let itLikeChildren: Bool
    let isSpicy: Bool
    let isWeightProduct: Bool
    
    init(idProduct: String, imageProduct: String, priceProduct: Int, weightProduct: Double, nameProduct: String, descriptionProduct: String, itLikeChildren: Bool, isSpicy: Bool, isWeightProduct: Bool) {
        self.idProduct = idProduct
        self.imageProduct = imageProduct
        self.priceProduct = priceProduct
        self.weightProduct = weightProduct
        self.nameProduct = nameProduct
        self.descriptionProduct = descriptionProduct
        self.itLikeChildren = itLikeChildren
        self.isSpicy = isSpicy
        self.isWeightProduct = isWeightProduct
    }
}






