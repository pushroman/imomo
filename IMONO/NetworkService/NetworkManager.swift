//
//  NetworkManager.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

class NetworkManager: networkManagerProtocol {
    func mainRequest<T: Decodable>(component: URLComponents, complition: @escaping (Result<T, Error>) -> (Void)) {
        guard let url = component.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, respoce, error in
            guard error == nil else {
                complition(.failure(error!))
                return
            }

            guard let data = data else {
                return
            }
            
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

