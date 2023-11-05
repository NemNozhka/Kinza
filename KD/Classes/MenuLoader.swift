//
//  MenuLoader.swift
//  KD
//
//  Created by Сергей Ножка on 27.08.2023.
//

import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

/// Отвечает за загрузку данных меню из Firestore и Firebase Storage.
class MenuLoader {
    
    /// Ссылки на Firestore и Firebase Storage.
    private let db = Firestore.firestore()
    private let storage = Storage.storage()

    /// Загружает все продукты из конкретной коллекции в Firestore.
    func loadCollection(_ collectionName: String, completion: @escaping ([ProductModel]?, Error?) -> Void) {
        // Доступ к документам заданной коллекции в Firestore.
        db.collection(collectionName).getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                // В случае ошибки или отсутствия документов вызываем completion с ошибкой.
                completion(nil, error)
                return
            }
            // Преобразовываем документы Firestore в массив моделей продуктов.
            let products = documents.compactMap { try? $0.data(as: ProductModel.self) }
            // Возвращаем полученные продукты через completion handler.
            completion(products, nil)
        }
    }

    /// Загружает URL изображения для продукта из Firebase Storage.
    func loadImageForProduct(url: String, completion: @escaping (String?, Error?) -> Void) {
        // Получаем ссылку на изображение в Firebase Storage.
        let imageRef = storage.reference(forURL: url)
        // Загружаем URL для доступа к изображению.
        imageRef.downloadURL { (downloadURL, error) in
            // Возвращаем URL или ошибку через completion handler.
            completion(downloadURL?.absoluteString, error)
        }
    }
}




























