//
//  BasketViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableBasketView.reloadData()
        view.backgroundColor = .white
        title = "Корзина"
        AppSettings.settings.basket
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        tableBasketView.reloadData()
    }
    
    let tableBasketView = UITableView()
    
    private let clearBasketButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapClearButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapClearButton() {
        print("basket Clear")
        AppSettings.settings.basket.removeAll()
        UserDefaults.standard.removeObject(forKey: AppSettings.basketKey)
        tableBasketView.reloadData()
    }
}

private extension BasketViewController {
    func initialize() {
        tableBasketView.bounces = false
        tableBasketView.backgroundColor = .systemGray6
        tableBasketView.dataSource = self
        //tableBasketView.separatorColor = .clear
        tableBasketView.register(BasketViewCell.self, forCellReuseIdentifier: String(describing: BasketViewCell.self))
        view.addSubview(tableBasketView)
        tableBasketView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(clearBasketButton)
        clearBasketButton.backgroundColor = .blue
        clearBasketButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.bottom.trailing.equalToSuperview().offset(-100)
        }
    }
}



extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppSettings.settings.basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = AppSettings.settings.basket[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
        cell.configure(with: item)
        return cell
    }
}


