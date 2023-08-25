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
        initialize()
        title = "Меню"
        
    }
    private let tableView = UITableView()
}


extension MenuViewController {
    func initialize() {
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
        let item = Menu.menu[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else {return UITableViewCell()}
        cell.configure(with: item)
        cell.addProductClosure = {
            AppSettings.settings.basket.append(item)
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectCell = tableView.cellForRow(at: indexPath)
//
//        let singleProductView = SingleProductView()
//
//        self.present(singleProductView, animated: true, completion: nil)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let indexPath = tableView.indexPathForSelectedRow  else { return }
        let item = Menu.menu[indexPath.row]

        let singleProductView = SingleProductView()
        singleProductView.configure(with: item)
            DispatchQueue.main.async {
                self.navigationController?.present(singleProductView, animated: true)
            }
        }
}

