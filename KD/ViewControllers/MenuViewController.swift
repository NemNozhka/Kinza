//
//  MenuViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit


class MenuViewController: UIViewController {
    
    var selectedSegmentIndex = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableHeaderViewForMenu.menuViewController = self
        setTableView()
        title = "Меню"
        NotificationCenter.default.addObserver(self, selector: #selector(basketChanged), name: Notification.Name("BasketChanged"), object: nil)
    }
    
    @objc func basketChanged() {
        menuTableView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateTableForSegment(index: Int) {
        selectedSegmentIndex = index
        
        // Выбираем первую строку в секции, соответствующей выбранному сегменту
        let indexPath = IndexPath(row: 0, section: index)
        
        // Прокручиваем таблицу к этой строке
        menuTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    let tableHeaderViewForMenu = TableHeaderViewForMenu()
    
    let menuTableView = UITableView()
    func setTableView() {
        menuTableView.bounces = false
        menuTableView.backgroundColor = .systemGray6
        menuTableView.dataSource = self
        menuTableView.tableHeaderView = tableHeaderViewForMenu
        tableHeaderViewForMenu.menuViewController = self
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return Menu.menu.count // Количество разделов в вашем меню
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.menu[section].count // Количество продуктов в данной секции
    }
    
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIConstants.ConstantsForMenuViewCell.cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = Menu.menu[indexPath.section][indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else { return UITableViewCell() }
        cell.configure(with: product)
        let id = product.idProduct
        cell.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = Menu.menu[indexPath.section][indexPath.row]
        let singleProductView = SingleProductView()
        singleProductView.configure(with: product)
        let id = product.idProduct
        singleProductView.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
        }
        present(singleProductView, animated: true)
    }
}

