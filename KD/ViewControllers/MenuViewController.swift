//
//  MenuViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit


class MenuViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        title = "Меню"
    }
    
    private let tableView = UITableView()
    func setTableView() {
        tableView.bounces = false
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.separatorColor = .clear // cellID
        tableView.register(MenuViewCell.self, forCellReuseIdentifier: "cellMenu")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Menu.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = Menu.menu[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else {return UITableViewCell()}
        cell.configure(with: item)
//        cell.productInfo = item
        cell.addProductClosure = { [self] in
//            if var productInfo = cell.productInfo {
//                productInfo.isInBasket = true
//                productInfo.quantityInBasket += 1
//                AppSettings.settings.basket.append(productInfo)
//                print("quantityInBasket \(productInfo.nameProduct) = \(productInfo.quantityInBasket)")
//                print("isInBasket \(productInfo.nameProduct) = \(productInfo.isInBasket)")
//                }
            item.quantityInBasket += 1
            item.isInBasket = true
            AppSettings.settings.basket.append(item)
            print("Изменили isInBasket, теперь =  \(item.isInBasket) \(item.nameProduct)")
            print("Изменинли quantityInBasket, теперь = \(item.quantityInBasket) \(item.nameProduct)")
        }
        // смотрим есть ли товар в корзине, если есть - пишем в корзине. Если нет - пишем цену
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow  else { return }
        var item = Menu.menu[indexPath.row]
        
        let singleProductView = SingleProductView()
        singleProductView.configure(with: item)
        singleProductView.addProductClosure = { [self] in
            item.quantityInBasket += 1
            item.isInBasket = true
            AppSettings.settings.basket.append(item)
            print("Изменили isInBasket, теперь =  \(item.isInBasket) \(item.nameProduct)")
            print("Изменинли quantityInBasket, теперь = \(item.quantityInBasket) \(item.nameProduct)")
            
        }
        present(singleProductView, animated: true)
    }
}

