//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct ProductModel: Codable, Identifiable {
    @DocumentID var id: String?
    var imageProduct: String?
    let priceProduct: Int
    var weightProduct: Double
    var quantityProduct: Int
    let nameProduct: String
    let descriptionProduct: String
    let itLikeChildren: Bool
    let isSpicy: Bool
    let isWeightProduct: Bool
}







