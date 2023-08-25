//
//  ProductModel.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class Menu {
    static let menu: [ProductModel] = [
        ProductModel(imageProduct: UIImage(named: "4Сыра"), priceProduct: 660, nameProduct: "4 сыра", discriptionProduct: "Сливочныи coуc, сыр моцарелла, сыр чеддер, сыр пармезан, сыр блю-чиз", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Барберкю")!, priceProduct: 690, nameProduct: "BBQ", discriptionProduct: "Томатныи coуc, сыр моцарелла, свиной шашлык, ветчина, охотничьи колбаски, перец болгарский, красныи лук, руккола, coуc барбекью", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Гавайская")!, priceProduct: 630, nameProduct: "Гавайская", discriptionProduct: "Томатный coуc, сыр моцарелла, ветчина, куриное бедро, ананас, орегано сушеное", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Маргарита")!, priceProduct: 530, nameProduct: "Маргарита", discriptionProduct: "Томатный соус, томаты, моцарелла в рассоле, соус песто", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Милано")!, priceProduct: 590, nameProduct: "Милано", discriptionProduct: "Красный coуc, сыр моцарелла, куриное бедро, помидоры, корнишоны, маслины жареные, шампиньоны, красный лук", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Океан")!, priceProduct: 790, nameProduct: "Океан", discriptionProduct: "Соус морской, сыр моцарелла, маслины, томаты черри, креветки, мидии, лосось, икра красная, руккола", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Острая")!, priceProduct: 670, nameProduct: "Острая", discriptionProduct: "Томатныи coуc, сыр моцарелла, свинои шашлык, халапеньо, корнишоны, карпаччо куриное, красный лук", itLikeChildren: false, isSpicy: true),
        ProductModel(imageProduct: UIImage(named: "Пеперони")!, priceProduct: 570, nameProduct: "Пеперони", discriptionProduct: "Томатный coуc, сыр моцарелла, колбаса пряная пеперони", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Прошутто")!, priceProduct: 610, nameProduct: "Прошутто", discriptionProduct: "Сливочно-грибной coуc, сыр моцарелла, ветчина, жареные шампиньоны, лук красный, томаты черри, руккола", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Цезарь")!, priceProduct: 790, nameProduct: "Цезарь", discriptionProduct: "Сливочный coуc, сыр моцарелла, куриное бедро, бекон, пармезан, томаты черри, перепелиные яйца, coуc цезарь, айсберг", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Чизбургер")!, priceProduct: 790, nameProduct: "Чизбургер", discriptionProduct: "Томатный coуc, сыр чеддер, говажий фарш, помидоры, бекон, горчица зернистая, корнишон, айсберг", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ЛюляБаранина")!, priceProduct: 270, nameProduct: "Люля-кебаб баранина", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ЛюляКурица")!, priceProduct: 220, nameProduct: "Люля-кебаб куриный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ШашлыкИзБаранины")!, priceProduct: 210, nameProduct: "Шашлык из баранины", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ШашлыкИзКурицы")!, priceProduct: 110, nameProduct: "Шашлык из курицы", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ШашлыкИзСвинины,Корейка")!, priceProduct: 170, nameProduct: "Шашлык из свинины, корейка", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ШашлыкИзСвинины,Шея")!, priceProduct: 190, nameProduct: "Шашлык из свинины, шея", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ШампиньоныГриль")!, priceProduct: 150, nameProduct: "Шампиньоны гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "КартофельПеченый")!, priceProduct: 120, nameProduct: "Картофель печеный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "СалатОвощиГриль")!, priceProduct: 280, nameProduct: "Салат овощи гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ХачапуриНаШампуре")!, priceProduct: 220, nameProduct: "Хачапури на шампуре", discriptionProduct: "250 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ХачапуриПоАджарски")!, priceProduct: 390, nameProduct: "Хачапури по-аджарски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ХачапуриПоИмеретински")!, priceProduct: 390, nameProduct: "Хачапури по-имеретински", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ХачапуриПоМегрельски")!, priceProduct: 390, nameProduct: "Хачапури по-мегрельски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ЗеленьВАссортименте")!, priceProduct: 120, nameProduct: "Зелень в ассортименте", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "ОвощиНарезка")!, priceProduct: 270, nameProduct: "Овощи нарезка", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "СалатОвощной")!, priceProduct: 240, nameProduct: "Салат овощной", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "СоусТоматный")!, priceProduct: 80, nameProduct: "Соус томатный", discriptionProduct: "80 мл.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "СырБрынза")!, priceProduct: 660, nameProduct: "Сыр брынза", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: UIImage(named: "Хлеб")!, priceProduct: 80, nameProduct: "Хлеб", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)
    ]
    
}



//struct ProductModel {
//
//    let imageProduct: UIImage
//    let priceProduct: Int
//    let nameProduct: String
//    let discriptionProduct: String?
//    let itLikeChildren: Bool
//    let isSpicy: Bool
//
//
//}


//    let type: CategoryProduct

//let favoriteProduct: Bool // избранное
//let measurementProduct: String? // единица измерение продукта
//let quantityProduct: String? //кол-во
//    let type: CategoryProduct //категория

//enum CategoryProduct {
//    case khachapuri // хачапури
//    case pizza  // пицца
//    case brazier // мангал
//    case additionally //дополнительно, к блюду
//}


struct ProductModel {
    let imageProduct: UIImage?
    let priceProduct: Int
    let nameProduct: String
    let discriptionProduct: String?
    let itLikeChildren: Bool
    let isSpicy: Bool
}

//class ProductModel2: NSObject, NSCoding {
//    let imageProduct: UIImage
//    let priceProduct: Int
//    let nameProduct: String
//    let discriptionProduct: String?
//    let itLikeChildren: Bool
//    let isSpicy: Bool
//
////    init(imageProduct: UIImage, priceProduct: Int, nameProduct: String, discriptionProduct: String?, itLikeChildren: Bool, isSpicy: Bool) {
////        self.imageProduct = imageProduct
////        self.priceProduct = priceProduct
////        self.nameProduct = nameProduct
////        self.discriptionProduct = discriptionProduct
////        self.itLikeChildren = itLikeChildren
////        self.isSpicy = isSpicy
////    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(imageProduct, forKey: "imageProduct")
//        coder.encode(priceProduct, forKey: "priceProduct")
//        coder.encode(nameProduct, forKey: "nameProduct")
//        coder.encode(discriptionProduct, forKey: "discriptionProduct")
//        coder.encode(itLikeChildren, forKey: "itLikeChildren")
//        coder.encode(isSpicy, forKey: "isSpicy")
//    }
//
//    required convenience init?(coder: NSCoder) {
//        guard let imageProduct = coder.decodeObject(forKey: "imageProduct") as? UIImage,
//              let nameProduct = coder.decodeObject(forKey: "nameProduct") as? String,
//              let discriptionProduct = coder.decodeObject(forKey: "discriptionProduct") as? String?,
//              let itLikeChildren = coder.decodeBool(forKey: "itLikeChildren") as? Bool,
//              let isSpicy = coder.decodeBool(forKey: "isSpicy") as? Bool
//        else {
//            return nil
//        }
//
//        self.init(imageProduct: imageProduct, priceProduct: coder.decodeInteger(forKey: "priceProduct"), nameProduct: nameProduct, discriptionProduct: discriptionProduct, itLikeChildren: itLikeChildren, isSpicy: isSpicy)
//    }
//}
