//
//  SingleProductView.swift
//  KD
//
//  Created by Сергей Ножка on 21.08.2023.
//

import UIKit
import SnapKit



class SingleProductView: UIViewController {
    
    func configure(with info: ProductModel) {
        imageProduct.image = UIImage(named: info.imageProduct)
        labelNameProduct.text = info.nameProduct
        labelDiscription.text = info.discriptionProduct
        addBasketButton.setTitle("Добавить в корзину за \(info.priceProduct) Р.", for: .normal)
        labelWeight.text = "Вес: \(info.weight) гр."
    }
    
    func initializeUI() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetBackButtonFromTop)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetBackButtonFromLeading)
            make.size.equalTo(UIConstants.ConstantsForSingleProductView.sizeBackButton)
        }
        
        if let imageView = backButton.imageView {
            imageView.snp.makeConstraints { make in
                make.size.equalTo(UIConstants.ConstantsForSingleProductView.sizeBackButton)
            }
        }
        
        view.addSubview(labelNameProduct)
        labelNameProduct.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetNameLabelFromTop)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(imageProduct)
        imageProduct.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.ConstantsForSingleProductView.imageProductSize)
            make.top.equalTo(labelNameProduct.snp.bottom).offset(UIConstants.ConstantsForSingleProductView.insetImageProductFromNameLabel)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(labelDiscription)
        labelDiscription.snp.makeConstraints { make in
            make.top.equalTo(imageProduct.snp.bottom).offset(UIConstants.ConstantsForSingleProductView.insetLabelDescriptionFromImageProduct)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetLabelDescriptionFromLeading)
            make.trailing.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetLabelDesriptionFromTrailing)
        }
        
        view.addSubview(labelWeight)
        labelWeight.snp.makeConstraints { make in
            make.top.equalTo(labelDiscription.snp.bottom).offset(UIConstants.ConstantsForSingleProductView.InsetLabelWeightFromLabelDiscriprion)
            make.leading.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetLabelWeightFromLeading)
        }
        
        view.addSubview(addBasketButton)
        addBasketButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetAddBasketButtonFromBottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(UIConstants.ConstantsForSingleProductView.widthAddBasketButton)
            make.height.equalTo(UIConstants.ConstantsForSingleProductView.heightAddBusketButton)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        AppSettings.settings.basket
        navigationItem.titleView
    }
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.tintColor = .systemGray2
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackMenu), for: .touchUpInside)
        return backButton
    }()
    
    @objc func didTapBackMenu() {
        print("Tap didTapBackMenu")
        dismiss(animated: true)
    }
    
    private let imageProduct: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = UIConstants.ConstantsForSingleProductView.imageProductSize * 0.15
        image.clipsToBounds = true
        return image
    }()
    
    private let labelNameProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: UIConstants.ConstantsForSingleProductView.labelSize, weight: .bold)
        return label
    }()
    
    private let addBasketButton: UIButton = {
        let addBasketButton = UIButton(type: .system)
        addBasketButton.titleLabel?.font = .systemFont(ofSize: UIConstants.ConstantsForMenuViewCell.labelSize, weight: .medium)
        addBasketButton.backgroundColor = UIConstants.Colors.colorBackGroundColorButton
        addBasketButton.tintColor = .black
        addBasketButton.layer.cornerRadius = 10
        addBasketButton.addTarget(self, action: #selector(didTapAddBasketButton), for: .touchUpInside)
        return addBasketButton
    }()
    
    var addProductClosure: (() -> Void)?
    
    @objc func didTapAddBasketButton() {
        print("Tap AddBasketProduct")
        addProductClosure?()
        dismiss(animated: true)
    }
    
    private let labelDiscription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    private let labelWeight: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
}


