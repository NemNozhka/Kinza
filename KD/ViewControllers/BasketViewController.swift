//
//  BasketViewTable.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController, UITextFieldDelegate { /*BasketViewCellDelegate*/
    
    var sumBasket = 0
    
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
        let item = AppSettings.settings.basket[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellBasket", for: indexPath) as? BasketViewCell else {return UITableViewCell()}
        //        cell.indexPath = indexPath
        //        cell.delegateBasketCell = self
        cell.configure(with: item)
        cell.lessProductClosure = { [self] in
            AppSettings.settings.basket.remove(at: indexPath.row)
            basketTableView.beginUpdates()
            basketTableView.deleteRows(at: [indexPath], with: .fade)
            basketTableView.endUpdates()
            basketTableView.reloadData()
        }
        cell.productInfo = item
        cell.moreProductClosure = { [self] in
            if var productInfo = cell.productInfo {
                            productInfo.quantityInBasket += 1
                print("Изменили quantityInBasket, теперь = \(productInfo.nameProduct) = \(productInfo.quantityInBasket)")
                
                            }
        }
        return cell
    }
    
    //    func indexPathForCell(_ cell: BasketViewCell) -> IndexPath? {
    //        if let indexPath = basketTableView.indexPath(for: cell) {
    //            return indexPath
    //        }
    //        return nil
    //    }
    
    //    func deleteProductAtIndexPath(_ indexPath: IndexPath) {
    //        AppSettings.settings.basket.remove(at: indexPath.row)
    //
    //        basketTableView.beginUpdates()
    //        basketTableView.deleteRows(at: [indexPath], with: .fade)
    //        basketTableView.endUpdates()
    //
    //        updateBasket()
    //    }
    
    //    func updateBasket() {
    //        basketTableView.reloadData()
    //    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


