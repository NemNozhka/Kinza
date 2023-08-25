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
    
    private enum UIConstants {
        static let heightTextField: CGFloat = 100
        static let widthTextField: CGFloat = 100
        static let insetTopTextFieldFromBottomTableView: CGFloat = 20
        static let offsetBottomTextFieldFromTopTabBar: CGFloat = 20
        static let insetTrailingTextFieldFromView: CGFloat = 20
        static let offsetLeadingTextFieldFromView: CGFloat = 20
    }
    
    private let tableBasketView = UITableView()
    
    
    
    
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
        self.navigationItem.leftBarButtonItem = self.editButtonItem
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
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle { //метод который в качестве выходного объекта возращает элемент который будет выден при нажатии кнопки Edit
//        //если нам нужно delete то можно не писать данный метод потому что он по дефолту ставит там кнопку delete
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { //функция котора позволяет делать в зависимости от того что мы выбрали в функции выше delete(удалить) или insert(добавить)
//        if editingStyle == .delete {
//            AppSettings.settings.basket.remove(at: indexPath.row) //удаляем объект под тем индексом с которым работаем (удаляем тот объект на который ткнули)
//            tableBasketView.deleteRows(at: [indexPath], with: .fade) //удалем объект из tableView (ЭТО ОБЯЗАТЕЛЬНО!) под индексом который выбрали ("at:") с определенной  анимацией ("with:")
//
//            //сейчас при удалении объекта мы не удаляем объект из памяти устройства, т.е. при перезапуске симулятора снова будет прежнее кол-во объектов в нашем списке
//            //что бы удалять из памяти устройства нужно пройти курс CoreData там уже обучат как хранить и удалять данные в памяти устройства
//        }
//    }
}


