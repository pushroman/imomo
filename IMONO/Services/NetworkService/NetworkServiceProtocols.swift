//
//  NetworkServiceProtocols.swift.swift
//  IMONO
//
//  Created by Роман Пушкарев on 06.04.2025.
//

import Foundation

protocol networkManagerProtocol {
    func mainRequest<T: Decodable>(component: URLComponents, complition: @escaping (Result<T, Error>) -> Void)
}

protocol RadioStationProtocol {
    func reqest(complition: @escaping (Result <[RadioStation], Error>) -> Void)
}

protocol urlComponentProtocol {
    static func urlComponent() -> URLComponents
}
