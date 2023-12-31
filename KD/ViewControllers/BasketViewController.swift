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
        view.backgroundColor = .systemGray6
        title = "Корзина"
        initialize()
        basketTableView.reloadData()
        AppSettings.settings.cnahgeBasketClosure = { [weak self] in
            self?.basketTableView.reloadData()
        }
       
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        basketTableView.reloadData()
    }
    
    
    
    
    
    let basketTableView = UITableView()
    let tableFooterViewForBasket = TableFooterViewForBasket()
}

private extension BasketViewController {
    func initialize() {
        basketTableView.bounces = false
        basketTableView.backgroundColor = .systemGray6
        basketTableView.dataSource = self
        basketTableView.delegate = self
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
        
        tableFooterViewForBasket.removeAllProductBasket = { [weak self] in
            AppSettings.settings.removeAll()
            self?.basketTableView.reloadData()
        }
        
        tableFooterViewForBasket.onShowThankYouView = { [weak self] in
            let thankYouViewController = ThankYouViewController()
            self?.present(thankYouViewController, animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIConstants.ConstantsForBasketViewCell.cellHeight  // ваша фиксированная высота ячейки
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
        let key = Array(AppSettings.settings.basket.keys)[indexPath.row]
        if let product = AppSettings.settings.basket[key] {
            cell.configure(with: product)
            cell.moreProductClosure = { [weak self] in
                AppSettings.settings.addItem(id: key)
                self?.basketTableView.reloadData()
            }
            cell.lessProductClosure = { [weak self] in
                AppSettings.settings.removeItem(id: key)
                self?.basketTableView.reloadData()
            }
            cell.removeProductClosure = { [weak self] in
                AppSettings.settings.removeSingleItem(id: key)
                self?.basketTableView.reloadData()
            }
            
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


