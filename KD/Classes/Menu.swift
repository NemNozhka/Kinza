//
//  Menu.swift
//  KD
//
//  Created by Сергей Ножка on 27.08.2023.
//

import UIKit

class Menu {
    static let menu: [ProductModel] = [
        ProductModel(imageProduct: "4Сыра", priceProduct: 660, weightProduct: "750", nameProduct: "4 сыра", descriptionProduct: "Сливочныи coуc, сыр моцарелла, сыр чеддер, сыр пармезан, сыр блю-чиз", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: "Барберкю", priceProduct: 690, weightProduct: "750", nameProduct: "BBQ", descriptionProduct: "Томатныи coуc, сыр моцарелла, свиной шашлык, ветчина, охотничьи колбаски, перец болгарский, красныи лук, руккола, coуc барбекью", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Гавайская", priceProduct: 630, weightProduct: "750", nameProduct: "Гавайская", descriptionProduct: "Томатный coуc, сыр моцарелла, ветчина, куриное бедро, ананас, орегано сушеное", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: "Маргарита", priceProduct: 530, weightProduct: "750", nameProduct: "Маргарита", descriptionProduct: "Томатный соус, томаты, моцарелла в рассоле, соус песто", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Милано", priceProduct: 590, weightProduct: "750", nameProduct: "Милано", descriptionProduct: "Красный coуc, сыр моцарелла, куриное бедро, помидоры, корнишоны, маслины жареные, шампиньоны, красный лук", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: "Океан", priceProduct: 790, weightProduct: "750", nameProduct: "Океан", descriptionProduct: "Соус морской, сыр моцарелла, маслины, томаты черри, креветки, мидии, лосось, икра красная, руккола", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Острая", priceProduct: 670, weightProduct: "750", nameProduct: "Острая", descriptionProduct: "Томатныи coуc, сыр моцарелла, свинои шашлык, халапеньо, корнишоны, карпаччо куриное, красный лук", itLikeChildren: false, isSpicy: true),
        ProductModel(imageProduct: "Пеперони", priceProduct: 570, weightProduct: "750", nameProduct: "Пеперони", descriptionProduct: "Томатный coуc, сыр моцарелла, колбаса пряная пеперони", itLikeChildren: true, isSpicy: false),
        ProductModel(imageProduct: "Прошутто", priceProduct: 610, weightProduct: "750", nameProduct: "Прошутто", descriptionProduct: "Сливочно-грибной coуc, сыр моцарелла, ветчина, жареные шампиньоны, лук красный, томаты черри, руккола", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Цезарь", priceProduct: 790, weightProduct: "750", nameProduct: "Цезарь", descriptionProduct: "Сливочный coуc, сыр моцарелла, куриное бедро, бекон, пармезан, томаты черри, перепелиные яйца, coуc цезарь, айсберг", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Чизбургер", priceProduct: 790, weightProduct: "750", nameProduct: "Чизбургер", descriptionProduct: "Томатный coуc, сыр чеддер, говажий фарш, помидоры, бекон, горчица зернистая, корнишон, айсберг", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ЛюляБаранина", priceProduct: 290, weightProduct: "750", nameProduct: "Люля-кебаб баранина", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ЛюляКурица", priceProduct: 240, weightProduct: "750", nameProduct: "Люля-кебаб куриный", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ШашлыкИзБаранины", priceProduct: 270, weightProduct: "750", nameProduct: "Шашлык из баранины", descriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ШашлыкИзКурицы", priceProduct: 140, weightProduct: "750", nameProduct: "Шашлык из курицы", descriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ШашлыкИзСвинины,Корейка", priceProduct: 210, weightProduct: "750", nameProduct: "Шашлык из свинины, корейка", descriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ШашлыкИзСвинины,Шея", priceProduct: 210, weightProduct: "750", nameProduct: "Шашлык из свинины, шея", descriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ШампиньоныГриль", priceProduct: 150, weightProduct: "750", nameProduct: "Шампиньоны гриль", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "КартофельПеченый", priceProduct: 140, weightProduct: "750", nameProduct: "Картофель печеный", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "СалатОвощиГриль", priceProduct: 280, weightProduct: "750", nameProduct: "Салат овощи гриль", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ХачапуриНаШампуре", priceProduct: 310, weightProduct: "750", nameProduct: "Хачапури на шампуре", descriptionProduct: "250 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ХачапуриПоАджарски", priceProduct: 390, weightProduct: "750", nameProduct: "Хачапури по-аджарски", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ХачапуриПоИмеретински", priceProduct: 390, weightProduct: "750", nameProduct: "Хачапури по-имеретински", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ХачапуриПоМегрельски", priceProduct: 390, weightProduct: "750", nameProduct: "Хачапури по-мегрельски", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ЗеленьВАссортименте", priceProduct: 120, weightProduct: "750", nameProduct: "Зелень в ассортименте", descriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "ОвощиНарезка", priceProduct: 270, weightProduct: "750", nameProduct: "Овощи нарезка", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "СалатОвощной", priceProduct: 240, weightProduct: "750", nameProduct: "Салат овощной", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "СоусТоматный", priceProduct: 80, weightProduct: "750", nameProduct: "Соус томатный", descriptionProduct: "80 мл.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "СырБрынза", priceProduct: 150, weightProduct: "100", nameProduct: "Сыр брынза", descriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false),
        ProductModel(imageProduct: "Хлеб", priceProduct: 80, weightProduct: "750", nameProduct: "Хлеб", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)
    ]
    
    static var map: [String: ProductModel] = {
        var productMap = [String: ProductModel]()
        for product in menu {
            productMap[product.id] = product
        }
        return productMap
    }()
}

