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
        
//        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
//                    self?.menuTableView.reloadData()
//            }
        NotificationCenter.default.addObserver(self, selector: #selector(basketChanged), name: Notification.Name("BasketChanged"), object: nil)
    }
    
    @objc func basketChanged() {
        menuTableView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    let menuTableView = UITableView()
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
        
        let item = Menu.menu[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else { return UITableViewCell() }
        cell.configure(with: item)
        let id = item.id
        cell.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow  else { return }
        let item = Menu.menu[indexPath.row]
        
        let singleProductView = SingleProductView()
        singleProductView.configure(with: item)
        let id = item.id
        singleProductView.addProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: id)
        }
        present(singleProductView, animated: true)
    }
}

