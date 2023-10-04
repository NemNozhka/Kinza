//
//  TelegramBot.swift
//  KD
//
//  Created by Сергей Ножка on 04.10.2023.
//

import Foundation
import Alamofire

class TelegramBot {
    
    static let botTG = TelegramBot()
    
    let botToken = "6077605851:AAG0xx_vog2lH-Pql7XarRPUU75wEBl39KY"
    let chatId = "-1001974282869"  // или ID вашего канала или чата
    
    func sendMessage(_ message: String, completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = "https://api.telegram.org/bot\(botToken)/sendMessage"
        let parameters: Parameters = [
            "chat_id": chatId,
            "text": message,
            "parse_mode": "Markdown"  // опционально: для форматирования текста
        ]
        
        AF.request(urlString, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(.success("Message sent successfully"))
                case let .failure(error):
                    print("Failed to send message: \(error)")
                    if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
    }
}
