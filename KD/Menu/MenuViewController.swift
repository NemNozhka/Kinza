//
//  MenuViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit


class MenuViewController: UIViewController {
    
    private let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        title = "Меню"
        
    }
//    Menu.items
    private let tableView = UITableView()
    private let itemsMenu: [MenuItemType] = [
        .menuItem(ProductModel(imageProduct: UIImage(named: "4Сыра")!, priceProduct: 660, nameProduct: "4 сыра", discriptionProduct: "Сливочныи coуc, сыр моцарелла, сыр чеддер, сыр пармезан, сыр блю-чиз", itLikeChildren: true, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Барберкю")!, priceProduct: 690, nameProduct: "BBQ", discriptionProduct: "Томатныи coуc, сыр моцарелла, свиной шашлык, ветчина, охотничьи колбаски, перец болгарский, красныи лук, руккола, coуc барбекью", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Гавайская")!, priceProduct: 630, nameProduct: "Гавайская", discriptionProduct: "Томатный coуc, сыр моцарелла, ветчина, куриное бедро, ананас, орегано сушеное", itLikeChildren: true, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Маргарита")!, priceProduct: 530, nameProduct: "Маргарита", discriptionProduct: "Томатный соус, томаты, моцарелла в рассоле, соус песто", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Милано")!, priceProduct: 590, nameProduct: "Милано", discriptionProduct: "Красный coуc, сыр моцарелла, куриное бедро, помидоры, корнишоны, маслины жареные, шампиньоны, красный лук", itLikeChildren: true, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Океан")!, priceProduct: 790, nameProduct: "Океан", discriptionProduct: "Соус морской, сыр моцарелла, маслины, томаты черри, креветки, мидии, лосось, икра красная, руккола", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Острая")!, priceProduct: 670, nameProduct: "Острая", discriptionProduct: "Томатныи coуc, сыр моцарелла, свинои шашлык, халапеньо, корнишоны, карпаччо куриное, красный лук", itLikeChildren: false, isSpicy: true)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Пеперони")!, priceProduct: 570, nameProduct: "Пеперони", discriptionProduct: "Томатный coуc, сыр моцарелла, колбаса пряная пеперони", itLikeChildren: true, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Прошутто")!, priceProduct: 610, nameProduct: "Прошутто", discriptionProduct: "Сливочно-грибной coуc, сыр моцарелла, ветчина, жареные шампиньоны, лук красный, томаты черри, руккола", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Цезарь")!, priceProduct: 790, nameProduct: "Цезарь", discriptionProduct: "Сливочный coуc, сыр моцарелла, куриное бедро, бекон, пармезан, томаты черри, перепелиные яйца, coуc цезарь, айсберг", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Чизбургер")!, priceProduct: 790, nameProduct: "Чизбургер", discriptionProduct: "Томатный coуc, сыр чеддер, говажий фарш, помидоры, бекон, горчица зернистая, корнишон, айсберг", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ЛюляБаранина")!, priceProduct: 270, nameProduct: "Люля-кебаб баранина", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ЛюляКурица")!, priceProduct: 220, nameProduct: "Люля-кебаб куриный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ШашлыкИзБаранины")!, priceProduct: 210, nameProduct: "Шашлык из баранины", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ШашлыкИзКурицы")!, priceProduct: 110, nameProduct: "Шашлык из курицы", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ШашлыкИзСвинины,Корейка")!, priceProduct: 170, nameProduct: "Шашлык из свинины, корейка", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ШашлыкИзСвинины,Шея")!, priceProduct: 190, nameProduct: "Шашлык из свинины, шея", discriptionProduct: "Минимальный заказ 400 гр. 100 гр. готового веса", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ШампиньоныГриль")!, priceProduct: 150, nameProduct: "Шампиньоны гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "КартофельПеченый")!, priceProduct: 120, nameProduct: "Картофель печеный", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "СалатОвощиГриль")!, priceProduct: 280, nameProduct: "Салат овощи гриль", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ХачапуриНаШампуре")!, priceProduct: 220, nameProduct: "Хачапури на шампуре", discriptionProduct: "250 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ХачапуриПоАджарски")!, priceProduct: 390, nameProduct: "Хачапури по-аджарски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ХачапуриПоИмеретински")!, priceProduct: 390, nameProduct: "Хачапури по-имеретински", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ХачапуриПоМегрельски")!, priceProduct: 390, nameProduct: "Хачапури по-мегрельски", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ЗеленьВАссортименте")!, priceProduct: 120, nameProduct: "Зелень в ассортименте", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "ОвощиНарезка")!, priceProduct: 270, nameProduct: "Овощи нарезка", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "СалатОвощной")!, priceProduct: 240, nameProduct: "Салат овощной", discriptionProduct: "200 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "СоусТоматный")!, priceProduct: 80, nameProduct: "Соус томатный", discriptionProduct: "80 мл.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "СырБрынза")!, priceProduct: 660, nameProduct: "Сыр брынза", discriptionProduct: "100 гр.", itLikeChildren: false, isSpicy: false)),
        .menuItem(ProductModel(imageProduct: UIImage(named: "Хлеб")!, priceProduct: 80, nameProduct: "Хлеб", discriptionProduct: "400 гр.", itLikeChildren: false, isSpicy: false)),
    ]
    
    //MARK: - редактирование существующих emoji
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        guard segue.identifier == tableView.dequeueReusableCell(withIdentifier: String(describing: MenuViewCell.self)) as! MenuViewCell  else { return }
//        let indexPath = tableView.indexPathForSelectedRow!
//        let product = itemsMenu[indexPath.row]
//        let navigationVC = segue.destination as! UINavigationController
//        let newEmojiVC = navigationVC.topViewController as! SingleProductView
//        newEmojiVC.product = product
//        newEmojiVC.title = "Edit" //изменили title у второго экрана
//
//
//    }
}


extension MenuViewController {
    func initialize() {
        tableView.bounces = false
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.separatorColor = .clear // cellID
        tableView.register(MenuViewCell.self, forCellReuseIdentifier: String(describing: MenuViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemsMenu[indexPath.row]
        switch item {
        case .menuItem(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuViewCell.self), for: indexPath) as! MenuViewCell
            cell.configure(with: post)
            cell.addProductClosure = {
                AppSettings.settings.basket.append(item)
            }
            return cell
        }
    }
}
