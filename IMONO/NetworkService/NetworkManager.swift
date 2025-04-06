//
//  NetworkManager.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

// POST
enum Api: String {
    case gpt = "https://llm.api.cloud.yandex.net/foundationModels/v1/completion"
    case speechKit = "https://tts.api.cloud.yandex.net/tts/v3/utteranceSynthesis"
}


class NetworkManager {
    private var apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

extension NetworkManager {
    
    // request
    func sendRequest<T: Decodable>(
        api: Api,
        method: String = "GET",
        body: T,
        complition: @escaping (Result<T, Error>) -> ()
    ) {
        guard let url = URL(string: api.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method

        // responce
        URLSession.shared.dataTask(with: request) { data, respoce, error in
            guard error == nil else {
                complition(.failure(error!))
                return
            }
            
            guard let data = data else {
                return
            }
            print(String(decoding: data, as: UTF8.self))
            // decode data
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                complition(.success(result))
            } catch {
                print(error.localizedDescription)
                complition(.failure(error))
            }
            
        }.resume()
    }
}
