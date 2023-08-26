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
        //        labelDiscriptionProduct.text = info.discriptionProduct
        //        buttonAddBasketProduct.setTitle("\(info.priceProduct) Р.", for: .normal)
        //        likeChildrenLabel.isHidden = !info.itLikeChildren
        //        spicyLabel.isHidden = !info.isSpicy
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        
    }
    
    //    private let imageButtonBack: UIImageView = {
    //       let imageButtonBack = UIImageView()
    //        imageButtonBack.image = UIImage(systemName: "chevron.down")
    //        imageButtonBack.tintColor = .systemGray2
    //        imageButtonBack.backgroundColor = .systemRed
    //
    //        return imageButtonBack
    //    }()
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.tintColor = .systemGray2
        backButton.backgroundColor = .green
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
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
        
        
        return label
    }()
}



extension SingleProductView {
    func initializeUI() {
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        if let imageView = backButton.imageView {
            imageView.snp.makeConstraints { make in
                make.width.equalTo(70)
                make.height.equalTo(70)
            }
        }
        
        view.addSubview(imageProduct)
        imageProduct.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.ConstantsForSingleProductView.imageProductSize)
            make.top.equalToSuperview().inset(UIConstants.ConstantsForSingleProductView.insetImageProductFromTop)
            make.centerX.equalToSuperview()
        }
    }
}

