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
        title = "Меню"
        AppSettings.settings.basket
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableBasketView.reloadData()
    }
    
    private enum UIConstants {
        static let heightTextField: CGFloat = 100
        static let widthTextField: CGFloat = 100
        static let insetTopTextFieldFromBottomTableView: CGFloat = 20
        static let offsetBottomTextFieldFromTopTabBar: CGFloat = 20
        static let insetTrailingTextFieldFromView: CGFloat = 20
        static let offsetLeadingTextFieldFromView: CGFloat = 20
    }
    
    private let tableBasketView = UITableView()
    private let commentTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.textColor = .black
        return textField
    }()
   
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
        
        tableBasketView.addSubview(commentTextField)
        commentTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.edges.equalToSuperview()
            
        }
    }
}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppSettings.settings.basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = AppSettings.settings.basket[indexPath.row]
        switch item {
        case .menuItem(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketViewCell.self), for: indexPath) as! BasketViewCell
            cell.configure(with: post)
            return cell
        }
    }
}


