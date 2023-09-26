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
    
    private let menuTableView = UITableView()
    func setTableView() {
        menuTableView.bounces = false
        menuTableView.backgroundColor = .systemGray6
        menuTableView.dataSource = self
        menuTableView.separatorColor = .clear // cellID
        menuTableView.register(MenuViewCell.self, forCellReuseIdentifier: "cellMenu")
        menuTableView.delegate = self
        menuTableView.dataSource = self
        view.addSubview(menuTableView)
        menuTableView.snp.makeConstraints { make in
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else { return UITableViewCell() }
        cell.configure(with: item)
        var id = item.id
        cell.productId = item.id
        cell.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
        }
        cell.updateCellClosure = { [weak self] in
            guard let productId = cell.productId, let product = Menu.map[cell.productId!] else {
                    return
                }

                if let productArray = AppSettings.settings.basket[productId], !productArray.isEmpty {
                    // Кнопка "В Корзине", неактивная
                    cell.buttonAddBasketProduct.setTitle("В Корзине", for: .normal)
                    cell.buttonAddBasketProduct.isEnabled = false
                } else {
                    // Кнопка с ценой, активная
                    cell.buttonAddBasketProduct.setTitle("\(String(item.priceProduct)) Руб.", for: .normal)
                    cell.buttonAddBasketProduct.isEnabled = true
                }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow  else { return }
        var item = Menu.menu[indexPath.row]
        
        let singleProductView = SingleProductView()
        singleProductView.configure(with: item)
        var id = item.id
        singleProductView.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
        }
        present(singleProductView, animated: true)
    }
}

