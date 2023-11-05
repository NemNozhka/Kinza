//
//  MenuViewCell.swift
//  KD
//
//  Created by Сергей Ножка on 03.08.2023.
//

import UIKit
import SnapKit
import SDWebImage
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

class MenuViewCell: UITableViewCell {
    private let cellID = "cellMenu"
    
    func configure(with info: ProductModel) {
        // Убеждаемся, что у нас есть валидный URL изображения и id продукта
        guard let imageUrlString = info.imageProduct,
              let imageUrl = URL(string: imageUrlString),
              let id = info.id else {
            // Если нет изображения или id, используем placeholder для изображения и выходим из функции
            imageProductView.image = UIImage(named: "placeholder")
            return
        }

        // Загружаем URL для изображения
        let imageRef = Storage.storage().reference(forURL: imageUrlString)
        imageRef.downloadURL { [weak self] (url, error) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let downloadUrl = url {
                    // Если URL успешно загружен, используем его для установки изображения
                    self.imageProductView.sd_setImage(with: downloadUrl, placeholderImage: UIImage(named: "placeholder"))
                } else {
                    // Если произошла ошибка, используем placeholder для изображения
                    self.imageProductView.image = UIImage(named: "placeholder")
                    print("Failed to get download URL: \(String(describing: error))")
                }
            }
        }

        // Обновляем текстовые метки и видимость лейблов
        DispatchQueue.main.async {
            self.labelNameProduct.text = info.nameProduct
            self.labelDiscriptionProduct.text = info.descriptionProduct
            self.likeChildrenLabel.isHidden = !info.itLikeChildren
            self.spicyLabel.isHidden = !info.isSpicy
        }
        
        // Проверяем, находится ли продукт в корзине, и обновляем состояние кнопки
        DispatchQueue.main.async {
            if self.isProductInBasket(id: id) {
                self.buttonAddBasketProduct.setTitle("В корзине", for: .normal)
                self.buttonAddBasketProduct.isEnabled = false
            } else {
                self.buttonAddBasketProduct.setTitle("\(info.priceProduct) Р.", for: .normal)
                self.buttonAddBasketProduct.isEnabled = true
            }
        }
    }
    
    func isProductInBasket(id: String) -> Bool {
        return AppSettings.settings.basket[id] != nil
    }
    
    func initialize() {
        contentView.backgroundColor = .systemGray6
        selectionStyle = .none //убрали выделение ячейки
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { make in

            make.leading.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetImageProductFromLeading)
            make.size.equalTo(UIConstants.ConstantsForMenuViewCell.imageProductSize)
        }
        
        let nameProductAndDiscriptionProductStackView = UIStackView()
        nameProductAndDiscriptionProductStackView.axis = .vertical
        nameProductAndDiscriptionProductStackView.addArrangedSubview(labelNameProduct)
        nameProductAndDiscriptionProductStackView.addArrangedSubview(labelDiscriptionProduct)
        nameProductAndDiscriptionProductStackView.spacing = UIConstants.ConstantsForMenuViewCell.spacingBetweenNameAndDiscription
        contentView.addSubview(nameProductAndDiscriptionProductStackView)
        nameProductAndDiscriptionProductStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(imageProductView.snp.trailing).offset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromImage)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetNameAndDiscriptionFromTrailing)
        }
        
        contentView.addSubview(likeChildrenLabel)
        likeChildrenLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageProductView)
            make.top.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetLikeChildrenFromImageProductTop)
            make.height.equalTo(UIConstants.ConstantsForMenuViewCell.heightLikeChildren)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthLikeChildren)
        }
        
        contentView.addSubview(spicyLabel)
        spicyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(imageProductView)
            make.top.equalTo(imageProductView).inset(UIConstants.ConstantsForMenuViewCell.insetSpicyLabelFromImageProductTop)
            make.height.equalTo(UIConstants.ConstantsForMenuViewCell.heightSpicyLabel)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthSpicyLabel)
        }
        
        contentView.addSubview(buttonAddBasketProduct)
        buttonAddBasketProduct.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForMenuViewCell.insetButtonFromTrailing)
            make.width.equalTo(UIConstants.ConstantsForMenuViewCell.widthButton)
            make.height.equalTo(UIConstants.ConstantsForMenuViewCell.heightButton)
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - изображение продукта
    private let imageProductView: UIImageView = {
        let imageProductView = UIImageView()
        imageProductView.contentMode = .scaleAspectFit
        imageProductView.layer.cornerRadius = UIConstants.ConstantsForMenuViewCell.imageProductSize * 0.15
        imageProductView.clipsToBounds = true
        return imageProductView
    }()
    
    //MARK: - Надпись названия продукта
    private let labelNameProduct: UILabel = {
        let labelNameProduct = UILabel()
        labelNameProduct.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelNameProductFontSize, weight: .bold)
        labelNameProduct.numberOfLines = 0
        return labelNameProduct
    }()
    
    //MARK: - Надпись описания продукта
    private let labelDiscriptionProduct: UILabel = {
        let labelDiscriptionProduct = UILabel()
        labelDiscriptionProduct.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelDiscriptionProductSize, weight: .light)
        labelDiscriptionProduct.numberOfLines = 0
        labelDiscriptionProduct.textColor = .systemGray
        return labelDiscriptionProduct
    }()
    
    //MARK: - Кнопка добавления продукта в корзину
    let buttonAddBasketProduct: UIButton = {
        let buttonAddBasketProduct = UIButton(type: .system)
        buttonAddBasketProduct.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelButtonAddBasketFontSize, weight: .medium)
        buttonAddBasketProduct.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        buttonAddBasketProduct.tintColor = .black
        buttonAddBasketProduct.layer.cornerRadius = 10
        buttonAddBasketProduct.addTarget(self, action: #selector(didTapAddBasketProduct), for: .touchUpInside)
        return buttonAddBasketProduct
    }()
    
    var addProductClosure: (() -> Void)?
    
    @objc func didTapAddBasketProduct(_ sender: UIButton) {
        print("Tap AddBasketProduct")
        addProductClosure?()
        
    }
    
    //MARK: - title дети обожают
    private let likeChildrenLabel: UILabel = {
        let likeLabel = UILabel()
        likeLabel.text = "Дети обожают"
        likeLabel.backgroundColor = UIConstants.Colors.colorLabelLikeChildren
        likeLabel.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.likeChildrenLabelFontSize, weight: .medium)
        likeLabel.textColor = .white
        likeLabel.clipsToBounds = true
        likeLabel.layer.cornerRadius = 7
        likeLabel.textAlignment = .center
        return likeLabel
    }()
    
    //MARK: - title острая
    private let spicyLabel: UILabel = {
        let spicyLabel = UILabel()
        spicyLabel.text = "Острая"
        spicyLabel.backgroundColor = UIConstants.Colors.colorSpicyLabel
        spicyLabel.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.spicyLabelLabelFontSize, weight: .medium)
        spicyLabel.textColor = .white
        spicyLabel.clipsToBounds = true
        spicyLabel.layer.cornerRadius = 7
        spicyLabel.textAlignment = .center
        return spicyLabel
    }()
}



