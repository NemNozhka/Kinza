//
//  BasketViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController, UITextFieldDelegate { 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basketTableView.reloadData()
        view.backgroundColor = .white
        title = "Корзина"
        AppSettings.settings.basket
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        basketTableView.reloadData()
    }
    
    let basketTableView = UITableView()
    
    var tableFooterViewForBasket = TableFooterViewForBasket()
    
    private let clearBasketButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapClearButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapClearButton() {
        print("basket Clear")
        AppSettings.settings.basket.removeAll()
        UserDefaults.standard.removeObject(forKey: AppSettings.basketKey)
        basketTableView.reloadData()
    }
}

private extension BasketViewController {
    func initialize() {
        basketTableView.bounces = false
        basketTableView.backgroundColor = .systemGray6
        basketTableView.dataSource = self
        basketTableView.tableFooterView = tableFooterViewForBasket
        basketTableView.isUserInteractionEnabled = true
        tableFooterViewForBasket.commentTextField.delegate = self
        tableFooterViewForBasket.adressTextField.delegate = self
        basketTableView.separatorColor = .clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        basketTableView.register(BasketViewCell.self, forCellReuseIdentifier: String(describing: BasketViewCell.self))
        view.addSubview(basketTableView)
        basketTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(clearBasketButton)
        clearBasketButton.backgroundColor = .blue
        clearBasketButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.bottom.trailing.equalToSuperview().offset(-100)
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppSettings.settings.basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allProducts = Array(AppSettings.settings.basket.values.joined())
        let product = allProducts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
        cell.configure(with: product)
        cell.productId = product.id
        cell.updateQuantityLabel()
        cell.moreProductClosure = { [weak self] in
            AppSettings.settings.addItem(id: product.id)
        }
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


