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
        view.backgroundColor = .white
        title = "Корзина"
        initialize()
        basketTableView.reloadData()
        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
            self?.basketTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableFooterViewForBasket.updateSumLabel()
        basketTableView.reloadData()
    }
    
    func updateTotalPrice() {
        let totalSum = AppSettings.getTotalPrice()
        tableFooterViewForBasket.summLabel.text = "Сумма заказа: \(totalSum) Руб."
        tableFooterViewForBasket.orderButton.setTitle("Оформить заказ на \(totalSum) Руб.", for: .normal)
        tableFooterViewForBasket.priceDeliveryLabel.text = "Стоимость доставки 100 Руб. Для бесплатной доставки добавьте корзину товара на сумму \(AppSettings.minimalPriceDelivery - totalSum) Руб."
        if totalSum > AppSettings.minimalPriceDelivery {
            tableFooterViewForBasket.priceDeliveryLabel.isHidden = true
            tableFooterViewForBasket.orderButton.setTitle("Оформить заказ на \(totalSum) Руб.", for: .normal)
        } else {
            tableFooterViewForBasket.priceDeliveryLabel.isHidden = false
            tableFooterViewForBasket.orderButton.setTitle("Оформить заказ на \(totalSum + AppSettings.priceDelivery) Руб.", for: .normal)
        }
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
        NotificationCenter.default.post(name: Notification.Name("BasketChanged"), object: nil)
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
        AppSettings.settings.basket.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
        let key = Array(AppSettings.settings.basket.keys)[indexPath.row]
        if let products = AppSettings.settings.basket[key], !products.isEmpty {
            let product = products.first!
            cell.configure(with: product)
            cell.labelQuantityProduct.text = "\(products.count)"
        }
        cell.lessProductClosure = { [weak self, weak cell] in
            guard let productId = cell?.productId else { return }
            AppSettings.settings.removeItem(id: productId)
            cell?.updateQuantityLabel(productId: productId)
            self?.basketTableView.reloadData()
            self?.updateTotalPrice()
        }
        
        cell.moreProductClosure = { [weak self, weak cell] in
            guard let productId = cell?.productId else { return }
            AppSettings.settings.addItem(id: productId)
            cell?.updateQuantityLabel(productId: productId)
            self?.basketTableView.reloadData()
            self?.updateTotalPrice()
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


