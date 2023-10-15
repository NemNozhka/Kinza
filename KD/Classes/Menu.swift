//
//  Menu.swift
//  KD
//
//  Created by Сергей Ножка on 27.08.2023.
//

import UIKit

class Menu {
    static let menu: [[ProductModel]] = [
        [ProductModel(idProduct: "CC873F75-17BD-4D2B-8ADD-F17E87BD191D", imageProduct: "4Сыра", priceProduct: 660, weightProduct: 0.75, nameProduct: "4 сыра", descriptionProduct: "Сливочныи coуc, сыр моцарелла, сыр чеддер, сыр пармезан, сыр блю-чиз", itLikeChildren: true, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "528B0BCC-08DB-48F1-A425-85E63D5B00A0", imageProduct: "Барберкю", priceProduct: 690, weightProduct: 0.75, nameProduct: "BBQ", descriptionProduct: "Томатныи coуc, сыр моцарелла, свиной шашлык, ветчина, охотничьи колбаски, перец болгарский, красныи лук, руккола, coуc барбекью", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "99077800-5904-4D24-9579-4A3E988038FB", imageProduct: "Гавайская", priceProduct: 630, weightProduct: 0.75, nameProduct: "Гавайская", descriptionProduct: "Томатный coуc, сыр моцарелла, ветчина, куриное бедро, ананас, орегано сушеное", itLikeChildren: true, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "60CE19BA-135D-4C91-885B-2E08FFB7EDD6", imageProduct: "Маргарита", priceProduct: 530, weightProduct: 0.75, nameProduct: "Маргарита", descriptionProduct: "Томатный соус, томаты, моцарелла в рассоле, соус песто", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "DA6DCED1-0EFB-49BD-A5D6-8AA7F1924D55", imageProduct: "Милано", priceProduct: 590, weightProduct: 0.75, nameProduct: "Милано", descriptionProduct: "Красный coуc, сыр моцарелла, куриное бедро, помидоры, корнишоны, маслины жареные, шампиньоны, красный лук", itLikeChildren: true, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "53F9D0BE-4D21-4761-8196-4367CCC87061", imageProduct: "Океан", priceProduct: 790, weightProduct: 0.75, nameProduct: "Океан", descriptionProduct: "Соус морской, сыр моцарелла, маслины, томаты черри, креветки, мидии, лосось, икра красная, руккола", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "3DDE7A74-41C2-470C-99C0-0306DB908B02", imageProduct: "Острая", priceProduct: 670, weightProduct: 0.75, nameProduct: "Острая", descriptionProduct: "Томатныи coуc, сыр моцарелла, свинои шашлык, халапеньо, корнишоны, карпаччо куриное, красный лук", itLikeChildren: false, isSpicy: true, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "D7E56384-DED6-431C-82DD-FA740A39AFCC", imageProduct: "Пеперони", priceProduct: 570, weightProduct: 0.75, nameProduct: "Пеперони", descriptionProduct: "Томатный coуc, сыр моцарелла, колбаса пряная пеперони", itLikeChildren: true, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "D21DA125-550A-4ED2-AABD-0EDE6CEA380A", imageProduct: "Прошутто", priceProduct: 610, weightProduct: 0.75, nameProduct: "Прошутто", descriptionProduct: "Сливочно-грибной coуc, сыр моцарелла, ветчина, жареные шампиньоны, лук красный, томаты черри, руккола", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "C1A13512-BEA1-4FA7-9727-EF446D4B5BDA", imageProduct: "Цезарь", priceProduct: 790, weightProduct: 0.75, nameProduct: "Цезарь", descriptionProduct: "Сливочный coуc, сыр моцарелла, куриное бедро, бекон, пармезан, томаты черри, перепелиные яйца, coуc цезарь, айсберг", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "8A64AA2E-C1D1-424D-B68D-708CC32D19C9", imageProduct: "Чизбургер", priceProduct: 790, weightProduct: 0.75, nameProduct: "Чизбургер", descriptionProduct: "Томатный coуc, сыр чеддер, говажий фарш, помидоры, бекон, горчица зернистая, корнишон, айсберг", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1)],
        [ProductModel(idProduct: "CEFBFD20-100D-4D99-99D4-C8C0B5D775BC", imageProduct: "ЛюляБаранина", priceProduct: 290, weightProduct: 0.2, nameProduct: "Люля-кебаб баранина", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "99413B38-32FB-43EF-BCDA-B8AE3E8044E2", imageProduct: "ЛюляКурица", priceProduct: 240, weightProduct: 0.2, nameProduct: "Люля-кебаб куриный", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "03E691C3-8AC0-4965-8D83-5CD4A48C79C3", imageProduct: "ШашлыкИзБаранины", priceProduct: 270, weightProduct: 0.4, nameProduct: "Шашлык из баранины", descriptionProduct: "Минимальный заказ 400 гр. Цена за 100 гр. готового веса", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "2A7CAB16-8F15-4218-90E6-E2BCE63F5905", imageProduct: "ШашлыкИзКурицы", priceProduct: 140, weightProduct: 0.4, nameProduct: "Шашлык из курицы", descriptionProduct: "Минимальный заказ 400 гр. Цена за 100 гр. готового веса", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "C1527EEA-780E-4DD4-9F5B-F938EDD05FAB", imageProduct: "ШашлыкИзСвинины,Корейка", priceProduct: 210, weightProduct: 0.4, nameProduct: "Шашлык из свинины, корейка", descriptionProduct: "Минимальный заказ 400 гр. Цена за 100 гр. готового веса", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "B0E0AA88-4F80-4681-9758-DDC32AE6D004", imageProduct: "ШашлыкИзСвинины,Шея", priceProduct: 210, weightProduct: 0.4, nameProduct: "Шашлык из свинины, шея", descriptionProduct: "Минимальный заказ 400 гр. Цена за 100 гр. готового веса", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "6D87A58E-C587-4F7C-BF22-ED6D53EF83DF", imageProduct: "ШампиньоныГриль", priceProduct: 150, weightProduct: 0.2, nameProduct: "Шампиньоны гриль", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "E7B8936A-4247-48F5-A3A7-37BF2DBBAB81", imageProduct: "КартофельПеченый", priceProduct: 140, weightProduct: 0.2, nameProduct: "Картофель печеный", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "1363ABD5-9A8B-4539-90B4-C2E07E049314", imageProduct: "СалатОвощиГриль", priceProduct: 280, weightProduct: 0.2, nameProduct: "Салат овощи гриль", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1)],
        [ProductModel(idProduct: "8FC51D01-5620-4E85-A231-D4400E0C5C46", imageProduct: "ХачапуриНаШампуре", priceProduct: 310, weightProduct: 0.25, nameProduct: "Хачапури на шампуре", descriptionProduct: "250 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "6224AF82-6C30-4D52-ABB2-F651E242A834", imageProduct: "ХачапуриПоАджарски", priceProduct: 390, weightProduct: 0.4, nameProduct: "Хачапури по-аджарски", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "5F2A4042-A2DD-49BE-BCE4-90709BBE6A70", imageProduct: "ХачапуриПоИмеретински", priceProduct: 390, weightProduct: 0.4, nameProduct: "Хачапури по-имеретински", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "6329FA28-F45B-402B-AA6A-0C36D8E40995", imageProduct: "ХачапуриПоМегрельски", priceProduct: 390, weightProduct: 0.4, nameProduct: "Хачапури по-мегрельски", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1)],
        [ProductModel(idProduct: "8E0D2919-31C1-4AA6-8646-38CF767D8BC9", imageProduct: "ЗеленьВАссортименте", priceProduct: 120, weightProduct: 0.1, nameProduct: "Зелень в ассортименте", descriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "4A2891EA-04B0-4A7D-AD76-41A9841EEB59", imageProduct: "ОвощиНарезка", priceProduct: 270, weightProduct: 0.2, nameProduct: "Овощи нарезка", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "8F3F6927-8678-47B3-AF1D-67A41302E582", imageProduct: "СалатОвощной", priceProduct: 240, weightProduct: 0.2, nameProduct: "Салат овощной", descriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "347A3E6E-95E5-4AC0-BC04-0432AE9EDFE0", imageProduct: "СоусТоматный", priceProduct: 80, weightProduct: 0.08, nameProduct: "Соус томатный", descriptionProduct: "80 мл.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1),
        ProductModel(idProduct: "A52EB2D5-F257-4A2A-BCD7-771FE8F84991", imageProduct: "СырБрынза", priceProduct: 150, weightProduct: 0.1, nameProduct: "Сыр брынза", descriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: true, quantityProduct: 1),
        ProductModel(idProduct: "76C18CAB-20E3-4B36-80DC-D08899AEA320", imageProduct: "Хлеб", priceProduct: 80, weightProduct: 0.4, nameProduct: "Хлеб", descriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false, isWeightProduct: false, quantityProduct: 1)]
    ]
    
    static var map: [String: ProductModel] = {
        var productMap = [String: ProductModel]()
        
        for section in menu {
            for product in section {
                productMap[product.idProduct] = product
            }
        }
        
        return productMap
    }()
}































