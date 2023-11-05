//
//  MenuViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    let tableHeaderViewForMenu = TableHeaderViewForMenu()
    static let menuTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Меню"
        NotificationCenter.default.addObserver(self, selector: #selector(basketChanged), name: Notification.Name("BasketChanged"), object: nil)
        setTableView()
//        Menu.loadMenu {
//                // обновите ваш UITableView, когда данные будут загружены
//            MenuViewController.menuTableView.reloadData()
//            }
    }
    
    @objc func basketChanged() {
        MenuViewController.menuTableView.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func setTableView() {
        view.addSubview(tableHeaderViewForMenu)
        tableHeaderViewForMenu.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                    make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
                }
        tableHeaderViewForMenu.buttonTapped = { [weak self] section in
            self?.scrollToSection(section: section)
        }
        MenuViewController.menuTableView.bounces = false
        MenuViewController.menuTableView.backgroundColor = .systemGray6
        MenuViewController.menuTableView.dataSource = self
        MenuViewController.menuTableView.separatorColor = .clear // cellID
        MenuViewController.menuTableView.register(MenuViewCell.self, forCellReuseIdentifier: "cellMenu")
        MenuViewController.menuTableView.delegate = self
        MenuViewController.menuTableView.dataSource = self

        view.addSubview(MenuViewController.menuTableView)
        MenuViewController.menuTableView.snp.makeConstraints { make in
            make.top.equalTo(tableHeaderViewForMenu.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)  // Используйте safeAreaLayoutGuide здесь
        }
    }
    
    private func scrollToSection(section: Int) {
            let indexPath = IndexPath(row: 0, section: section)
        MenuViewController.menuTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuManager.shared.menu[section].count // Количество продуктов в данной секции
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIConstants.ConstantsForMenuViewCell.cellHeight  // ваша фиксированная высота ячейки
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuManager.shared.menu.count // Количество разделов в вашем меню
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let product = MenuManager.shared.menu[indexPath.section][indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuViewCell else { return UITableViewCell() }
            cell.configure(with: product)
        guard let id = product.id else { return cell }  // Изменено
            cell.addProductClosure = { [weak self] in
                AppSettings.settings.addItem(id: id)
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let product = MenuManager.shared.menu[indexPath.section][indexPath.row]
            let singleProductView = SingleProductView()
            singleProductView.configure(with: product)
            guard let id = product.id else { return }  // Изменено
            singleProductView.addProductClosure = { [weak self] in
                AppSettings.settings.addItem(id: id)
            }
            present(singleProductView, animated: true)
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleIndexPaths = MenuViewController.menuTableView.indexPathsForVisibleRows ?? []
        let visibleSections = Set(visibleIndexPaths.map { $0.section })
        if let firstVisibleSection = visibleSections.min() {
            tableHeaderViewForMenu.updateSelectedButton(for: firstVisibleSection)
        }
    }
}

