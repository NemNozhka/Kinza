//
//  Menu.swift
//  KD
//
//  Created by Сергей Ножка on 27.08.2023.
//

import UIKit
import SnapKit

class Menu {
    static let menu: [ProductModel] = [
        ProductModel(imageProduct: "4Сыра", priceProduct: 660, weight: "750", nameProduct: "4 сыра", discriptionProduct: "Сливочныи coуc, сыр моцарелла, сыр чеддер, сыр пармезан, сыр блю-чиз", itLikeChildren: true, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Барберкю", priceProduct: 690, weight: "750", nameProduct: "BBQ", discriptionProduct: "Томатныи coуc, сыр моцарелла, свиной шашлык, ветчина, охотничьи колбаски, перец болгарский, красныи лук, руккола, coуc барбекью", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Гавайская", priceProduct: 630, weight: "750", nameProduct: "Гавайская", discriptionProduct: "Томатный coуc, сыр моцарелла, ветчина, куриное бедро, ананас, орегано сушеное", itLikeChildren: true, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Маргарита", priceProduct: 530, weight: "750", nameProduct: "Маргарита", discriptionProduct: "Томатный соус, томаты, моцарелла в рассоле, соус песто", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Милано", priceProduct: 590, weight: "750", nameProduct: "Милано", discriptionProduct: "Красный coуc, сыр моцарелла, куриное бедро, помидоры, корнишоны, маслины жареные, шампиньоны, красный лук", itLikeChildren: true, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Океан", priceProduct: 790, weight: "750", nameProduct: "Океан", discriptionProduct: "Соус морской, сыр моцарелла, маслины, томаты черри, креветки, мидии, лосось, икра красная, руккола", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Острая", priceProduct: 670, weight: "750", nameProduct: "Острая", discriptionProduct: "Томатныи coуc, сыр моцарелла, свинои шашлык, халапеньо, корнишоны, карпаччо куриное, красный лук", itLikeChildren: false, isSpicy: true, quantity: 1),
        ProductModel(imageProduct: "Пеперони", priceProduct: 570, weight: "750", nameProduct: "Пеперони", discriptionProduct: "Томатный coуc, сыр моцарелла, колбаса пряная пеперони", itLikeChildren: true, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Прошутто", priceProduct: 610, weight: "750", nameProduct: "Прошутто", discriptionProduct: "Сливочно-грибной coуc, сыр моцарелла, ветчина, жареные шампиньоны, лук красный, томаты черри, руккола", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Цезарь", priceProduct: 790, weight: "750", nameProduct: "Цезарь", discriptionProduct: "Сливочный coуc, сыр моцарелла, куриное бедро, бекон, пармезан, томаты черри, перепелиные яйца, coуc цезарь, айсберг", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Чизбургер", priceProduct: 790, weight: "750", nameProduct: "Чизбургер", discriptionProduct: "Томатный coуc, сыр чеддер, говажий фарш, помидоры, бекон, горчица зернистая, корнишон, айсберг", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ЛюляБаранина", priceProduct: 270, weight: "750", nameProduct: "Люля-кебаб баранина", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ЛюляКурица", priceProduct: 220, weight: "750", nameProduct: "Люля-кебаб куриный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ШашлыкИзБаранины", priceProduct: 210, weight: "750", nameProduct: "Шашлык из баранины", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ШашлыкИзКурицы", priceProduct: 110, weight: "750", nameProduct: "Шашлык из курицы", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ШашлыкИзСвинины,Корейка", priceProduct: 170, weight: "750", nameProduct: "Шашлык из свинины, корейка", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ШашлыкИзСвинины,Шея", priceProduct: 190, weight: "750", nameProduct: "Шашлык из свинины, шея", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ШампиньоныГриль", priceProduct: 150, weight: "750", nameProduct: "Шампиньоны гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "КартофельПеченый", priceProduct: 120, weight: "750", nameProduct: "Картофель печеный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "СалатОвощиГриль", priceProduct: 280, weight: "750", nameProduct: "Салат овощи гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ХачапуриНаШампуре", priceProduct: 220, weight: "750", nameProduct: "Хачапури на шампуре", discriptionProduct: "250 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ХачапуриПоАджарски", priceProduct: 390, weight: "750", nameProduct: "Хачапури по-аджарски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ХачапуриПоИмеретински", priceProduct: 390, weight: "750", nameProduct: "Хачапури по-имеретински", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ХачапуриПоМегрельски", priceProduct: 390, weight: "750", nameProduct: "Хачапури по-мегрельски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ЗеленьВАссортименте", priceProduct: 120, weight: "750", nameProduct: "Зелень в ассортименте", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "ОвощиНарезка", priceProduct: 270, weight: "750", nameProduct: "Овощи нарезка", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "СалатОвощной", priceProduct: 240, weight: "750", nameProduct: "Салат овощной", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "СоусТоматный", priceProduct: 80, weight: "750", nameProduct: "Соус томатный", discriptionProduct: "80 мл.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "СырБрынза", priceProduct: 660, weight: "750", nameProduct: "Сыр брынза", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false, quantity: 1),
        ProductModel(imageProduct: "Хлеб", priceProduct: 80, weight: "750", nameProduct: "Хлеб", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, quantity: 1)
    ]
}

